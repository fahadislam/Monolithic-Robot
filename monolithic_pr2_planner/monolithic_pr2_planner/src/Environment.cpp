#include <monolithic_pr2_planner/Environment.h>
#include <monolithic_pr2_planner/OccupancyGridUser.h>
#include <monolithic_pr2_planner/StateReps/RobotState.h>
#include <monolithic_pr2_planner/StateReps/DiscBaseState.h>
#include <monolithic_pr2_planner/StateReps/ContArmState.h>
#include <monolithic_pr2_planner/MotionPrimitives/ArmAdaptiveMotionPrimitive.h>
#include <monolithic_pr2_planner/Visualizer.h>
#include <monolithic_pr2_planner/Constants.h>
#include <boost/shared_ptr.hpp>
#include <boost/scoped_ptr.hpp>
#include <algorithm>
#include <cassert>
#include <stdio.h>
#include <monolithic_pr2_planner/StateReps/ContArmState.h> //fahad
#include <math.h>
#include <tf/tf.h>
#include <tf/transform_listener.h>
#include <message_filters/subscriber.h>
#include <tf/message_filter.h>
#include <tf/transform_datatypes.h>

#define GOAL_STATE 1
using namespace monolithic_pr2_planner;
using namespace boost;

RobotState repulsivestate_base, attractivestate_base; //to be fixed
RobotState repulsivestate_endeff, attractivestate_endeff; //to be fixed
RobotState repulsivestate_combined, attractivestate_combined;
bool samplingtimeout;
bool hzero=false;
int key_value = 0, gvalue = 0;
// stateid2mapping pointer inherited from sbpl interface. needed for planner.
Environment::Environment(ros::NodeHandle nh)
    : m_hash_mgr(new HashManager(&StateID2IndexMapping)),
        m_nodehandle(nh), m_mprims(m_goal),
        m_heur_mgr(new HeuristicMgr()),
        m_planner_type(T_SMHA) {
        m_param_catalog.fetch(nh);
        configurePlanningDomain();
}

/**
* @brief Resets the environment.
* @details Intended to be used between calls to subsequent planning
* requests.
*/

void Environment::passKeyValue(int val, int g)   //hack
{
    key_value = val;
    gvalue = g;
}

void Environment::reset() {
    m_heur_mgr->reset();
    // m_heur_mgr->setCollisionSpaceMgr(m_cspace_mgr);
    m_hash_mgr.reset(new HashManager(&StateID2IndexMapping));

    // Fetch params again, in case they're being modified between calls.
    // m_param_catalog.fetch(m_nodehandle);
}

/**
* @brief sets the planner type - mainly for experiments for the MHA paper
* @details change the internal planner type to any of the different planners
*/
void Environment::setPlannerType(int planner_type) {
    m_planner_type = planner_type;
    m_heur_mgr->setPlannerType(planner_type);
    ROS_INFO_NAMED(SEARCH_LOG, "Setting planner type: %d", m_planner_type);
}

bool Environment::configureRequest(SearchRequestParamsPtr search_request_params,
                                   int& start_id, int& goal_id) {
    SearchRequestPtr search_request = SearchRequestPtr(new SearchRequest(
        search_request_params));
    configureQuerySpecificParams(search_request);
    if(search_request->m_params->underspecified_start) {
        ROS_DEBUG_NAMED(CONFIG_LOG, "underspecified_start. Will generate start state.");
        generateStartState(search_request);
    }
    if (!setStartGoal(search_request, start_id, goal_id)) {
        return false;
    }

    return true;
}

int Environment::GetGoalHeuristic(int stateID) {
    // For now, return the max of all the heuristics
    return GetGoalHeuristic(stateID, 0);
}

int Environment::GetGoalHeuristic(int stateID, int goal_id) {
    // This vector is of size NUM_MHA_BASE_HEUR + 2
    // Eg, if NUM_MHA_BASE_HEUR is 2, that means there are 2 additional base
    // heuristics. So, the values will be endEff, Base, Base1, Base2

    GraphStatePtr successor = m_hash_mgr->getGraphState(stateID);
    if(m_goal->isSatisfiedBy(successor) || stateID == GOAL_STATE){
        return 0;
    }
    std::unique_ptr<stringintmap> values;
    m_heur_mgr->getGoalHeuristic(successor, values);

    for (auto& heur : (*values)) {
        ROS_DEBUG_NAMED(HEUR_LOG, "%s : %d", heur.first.c_str(), heur.second);
    }

double arm_xyz_weight_anchor = 40.0/0.02;

//2d cost multiplier by 2
double arm_xyz_weight = 40.0/0.02 /*root3*/     * 0.1;
double arm_rpy_weight = 40.0/2.0/(5.625*M_PI/180.0)      * 0.1;
double arm_fa_weight = 40.0/5.0/(2.0*M_PI/180.0)      * 0.01;
double base_xy_weight = 40.0/0.02      * 1.0;
double base_z_weight = 3000.0/0.02      * 0.001;
double base_theta_weight = 251.0/(M_PI/8.0)     * 1.0;


double arm_xyz_weight_goal = 40.0/0.02      * 0.5;
double arm_rpy_weight_goal = 40.0/2.0/(5.625*M_PI/180.0)      * 0.5;
double arm_fa_weight_goal = 40.0/5.0/(2.0*M_PI/180.0)      * 0.01;
double base_xy_weight_goal = 40.0/0.02      * 1.0;
double base_z_weight_goal = 3000.0/0.02      * 0.1;
double base_theta_weight_goal = 251.0/(M_PI/8.0)     * 1.0;

    int w1=1000, w2=10, w3 = 1000000;

    switch (m_planner_type) {
        case T_SMHA:
        case T_MHG_REEX:
        case T_MHG_NO_REEX:
        case T_ARA:
            switch (goal_id) {
                case 0: // Anchor
                {
                    double diff;
                    RobotState expansion_pose = successor->robot_pose();
                    ContObjectState s1 = expansion_pose.getObjectStateRelMap();
                    ContObjectState s2 = m_goal->getObjectState().getContObjectState();
                    diff = arm_xyz_weight_anchor*pow(pow((s1.x()-s2.x()),2)+pow(s1.y()-s2.y(),2)+pow(s1.z()-s2.z(),2),.5);
                    return std::max((*values).at("admissible_base"),(int)diff);
                    // return std::max((*values).at("admissible_endeff"), (*values).at("admissible_base"));
                }

                case 1: // Base1, Base2 heur
                {
                    //extra
                    double diff;
                    RobotState expansion_pose = successor->robot_pose();
                    ContObjectState s1 = expansion_pose.getObjectStateRelMap();
                    ContObjectState s2 = m_goal->getObjectState().getContObjectState();
                    diff = arm_xyz_weight_anchor*pow(pow(s1.x()-s2.x(),2)+pow(s1.y()-s2.y(),2)+pow(s1.z()-s2.z(),2),.5);
                    return std::max((*values).at("admissible_base"),(int)diff);
                    // return EPS2*(int)diff;
                }
                case 2:

                    return (*values).at("admissible_base");  //}
                case 4:
                {

                    RobotState expansion_pose = successor->robot_pose();

                    std::vector<double> config, repulconfig, attractconfig;

                    getConfigforXYpose(&config,expansion_pose);
                    // getConfigforXYpose(&repulconfig, repulsivestate);
                    getConfigforXYpose(&attractconfig, attractivestate_endeff);

                    double d1=0,d2 = 0;


                    for (int i=0; i<config.size(); i++)
                    {
                        if (i==0 || i==1 )
                            {//printf("diff %d is %f\n", i, fabs(config[i] - attractconfig[i]));
                                d2 += fabs(config[i] - attractconfig[i]);}
                        else if (i==3)
                             d2 += 10 * computeMinUnsignedAngleDiff(config[i], attractconfig[i]);
                        else
                            d2 += computeMinUnsignedAngleDiff(config[i], attractconfig[i]);
                    }

                    // for (int i=0; i<config.size(); i++)
                    // {
                    //     if (i==0 || i==1 || i==2)
                    //         d2 += fabs(config[i] - attractconfig[i]);
                    //     else
                    //         d1 += computeMinUnsignedAngleDiff(config[i], repulconfig[i]);
                    // }

                    return int(d2);// - int(w1*d1);
                }
                case 5:
                {

                    RobotState expansion_pose = successor->robot_pose();

                    std::vector<double> config, repulconfig, attractconfig;

                    getConfigforXYpose(&config,expansion_pose);
                    getConfigforXYpose(&repulconfig, repulsivestate_combined);
                    getConfigforXYpose(&attractconfig, attractivestate_base);

                    double d1=0,d2 = 0;


                    for (int i=0; i<config.size(); i++)
                    {
                        if (i==0 || i==1 )
                            {//printf("diff %d is %f\n", i, fabs(config[i] - attractconfig[i]));
                                d2 += fabs(config[i] - attractconfig[i]);}
                        else if (i==3)
                             d2 += 10 * computeMinUnsignedAngleDiff(config[i], attractconfig[i]);
                        else
                            d2 += computeMinUnsignedAngleDiff(config[i], attractconfig[i]);
                    }


                    return EPS2*(*values).at("admissible_base") + int(w2*d2) - int(w1*d1);
                }
                case 6:
                {


                    RobotState expansion_pose = successor->robot_pose();

                    std::vector<double> config, repulconfig, attractconfig;

                    getConfigforXYpose(&config,expansion_pose);
                    getConfigforXYpose(&repulconfig, repulsivestate_combined);
                    getConfigforXYpose(&attractconfig, attractivestate_combined);

                    double d1=0,d2 = 0;



                    if (!hzero)
                    {
                       for (int i=0; i<config.size(); i++)
                        {
                            if (i==0 || i==1)
                                d2 += pow(base_xy_weight*fabs(config[i] - attractconfig[i]),2);
                            else if (i==2)
                                d2 += pow(base_z_weight*computeMinUnsignedAngleDiff(config[i], attractconfig[i]),2);
                            else if (i==3)
                                d2 += pow(base_theta_weight*computeMinUnsignedAngleDiff(config[i], attractconfig[i]),2);
                        }

                        ContObjectState objstate1 = expansion_pose.getObjectStateRelBody().getContObjectState();
                        ContObjectState objstate2 = attractivestate_combined.getObjectStateRelBody().getContObjectState();
                        // printf("x %d y %d z %d x2 %d y2 %d z2 %d\n", objstate1.x(), objstate1.y(), objstate1.z(), objstate2.x(), objstate2.y(), objstate2.z());

                        d2 += pow(arm_xyz_weight*(objstate1.x() - objstate2.x()),2)
                            + pow(arm_xyz_weight*(objstate1.y() - objstate2.y()),2)
                            + pow(arm_xyz_weight*(objstate1.z() - objstate2.z()),2);

                        tf::Quaternion quat_state(objstate1.yaw(),objstate1.pitch(),objstate1.roll());
                        tf::Quaternion quat_goal(objstate2.yaw(),objstate2.pitch(),objstate2.roll());

                        double diff = quat_state.angleShortestPath(quat_goal);
                        d2 += pow(arm_rpy_weight*diff,2);

                        d2 = pow(d2,0.5);
                    // printf("d2 %d\n", int(d2));
                        return int(d2);
                    }

                    else
                    {

                        for (int i=0; i<config.size(); i++)
                        {
                            if (i==0 || i==1)
                                d2 += pow(base_xy_weight_goal*fabs(config[i] - attractconfig[i]),2);
                            else if (i==2)
                                d2 += pow(base_z_weight_goal*computeMinUnsignedAngleDiff(config[i], attractconfig[i]),2);
                            else if (i==3)
                                d2 += pow(base_theta_weight_goal*computeMinUnsignedAngleDiff(config[i], attractconfig[i]),2);
                        }



                        ContObjectState objstate1 = expansion_pose.getObjectStateRelMap(expansion_pose.getContBaseState());
                        ContObjectState objstate2 = attractivestate_combined.getObjectStateRelMap(attractivestate_combined.getContBaseState());
                        // printf("x %d y %d z %d x2 %d y2 %d z2 %d\n", objstate1.x(), objstate1.y(), objstate1.z(), objstate2.x(), objstate2.y(), objstate2.z());

                        d2 += pow(arm_xyz_weight_goal*(objstate1.x() - objstate2.x()),2)
                            + pow(arm_xyz_weight_goal*(objstate1.y() - objstate2.y()),2)
                            + pow(arm_xyz_weight_goal*(objstate1.z() - objstate2.z()),2);

                        tf::Quaternion quat_state(objstate1.yaw(),objstate1.pitch(),objstate1.roll());
                        tf::Quaternion quat_goal(objstate2.yaw(),objstate2.pitch(),objstate2.roll());

                        double diff = quat_state.angleShortestPath(quat_goal);
                        d2 += pow(arm_rpy_weight_goal*diff,2);

                        // w2 = (EPS2*key_value - gvalue) / (EPS1*d2);
                        d2 = pow(d2,0.5);
                        // printf("w2 %d\n", w2);
                        return int(d2);

                        // return int(232*d2) + (*values).at("admissible_base");
                    }
/////////////////////
                        // for (int i=0; i<config.size(); i++)
                        // {
                        //     if (i==0 || i==1 || i==2)
                        //         d1 += fabs(config[i] - attractconfig[i]);
                        //     else if (i==3)
                        //          d1 += computeMinUnsignedAngleDiff(config[i], repulconfig[i]);
                        //     else
                        //         d1 += computeMinUnsignedAngleDiff(config[i], repulconfig[i]);
                        // }
                    // printf("diff %f %f %f\n", fabs(objstate1.x() - objstate2.x()), fabs(objstate1.y() - objstate2.y()), fabs(objstate1.z() - objstate2.z()));
                    // d2+= fabs(objstate1.x() - objstate2.x()) + fabs(objstate1.y() - objstate2.y()) + fabs(objstate1.z() - objstate2.z())


                    // getchar();
                    // if ( int(w2*d2) - int(w1*d1) < 0)

                    // printf("d2 %d\n", int(d2));

                    // - int(w1*d1);


                }
            }
            break;
        case T_IMHA:
            switch (goal_id) {
                case 0: // Anchor
                    return std::max((*values).at("admissible_endeff"), (*values).at("admissible_base"));
                case 1: // ARA Heur
                    return EPS2*std::max((*values).at("admissible_endeff"), (*values).at("admissible_base"));
                case 2: // Base1, Base2 heur
                    return static_cast<int>(0.5f*(*values).at("base_with_rot_0") + 0.5f*(*values).at("admissible_endeff"));
                case 3:
                    return static_cast<int>(0.5f*(*values).at("base_with_rot_1") + 0.5f*(*values).at("admissible_endeff"));
            }
            break;
        case T_MPWA:
            return (goal_id+1)*(EPS1*EPS2/NUM_SMHA_HEUR)*std::max(
                (*values).at("admissible_endeff"), (*values).at("admissible_base"));
            break;
        case T_EES:
            switch (goal_id) {
                case 0: // Anchor
                    return std::max((*values).at("admissible_endeff"), (*values).at("admissible_base"));
                case 1: // Inadmissible
                    return (*values).at("base_with_rot_0") + (*values).at("admissible_endeff");
                    // return static_cast<int>(0.5f*(*values)[4] + 0.5f*(*values).at("admissible_endeff"));
                case 2: // Distance function
                    // return (*values)[2];
                    // ROS_DEBUG_NAMED(HEUR_LOG, "Arm : %d, Base : %d", (*values)[2],
                    // (*values)[3]);
                    return (*values)["uniform_2d"] + (*values)["uniform_3d"];
            }
            break;
    }

    // Post-paper
    // switch(goal_id){
    // case 0: //Anchor
    // return std::max(values.at("admissible_endeff"), values.at("admissible_base"));
    // case 1: // base
    // return values[2];
    // case 2: // Base + arm
    // return static_cast<int>(0.5f*values[2] +
    // 0.5f*values[0]);
    // }


    // ROS_DEBUG_NAMED(HEUR_LOG, "2: %d,\t 3: %d", values[2],
    // values[3]);
    // EES

    return std::max((*values).at("admissible_base"), (*values).at("admissible_endeff"));
}

void Environment::GetSuccs(int sourceStateID, vector<int>* succIDs,
                           vector<int>* costs){
    GetSuccs(sourceStateID, succIDs, costs, 0);
}

void Environment::GetSuccs(int sourceStateID, vector<int>* succIDs,
                           vector<int>* costs, int ii){


    assert(sourceStateID != GOAL_STATE);

    ROS_DEBUG_NAMED(SEARCH_LOG,
            "==================Expanding state %d==================",
                    sourceStateID);
    succIDs->clear();
    succIDs->reserve(m_mprims.getMotionPrims().size());
    costs->clear();
    costs->reserve(m_mprims.getMotionPrims().size());

    GraphStatePtr source_state = m_hash_mgr->getGraphState(sourceStateID);
    ROS_DEBUG_NAMED(SEARCH_LOG, "Source state is:");
    source_state->robot_pose().printToDebug(SEARCH_LOG);
    if (m_param_catalog.m_visualization_params.expansions) {
        RobotState expansion_pose = source_state->robot_pose();


        if ( ii==2 || ii ==1)
            {

                    // getchar();
                    expansion_pose.visualize(250/NUM_SMHA_HEUR*(ii+1));
                    // ContBaseState basestate = expansion_pose.getContBaseState();
                    // printf("x val %f\n", basestate.x());
                    // printf("y val %f\n", basestate.y());
                    // RightContArmState armState = state.right_arm();

                    // config->push_back(basestate.theta());
                }

        if ( ii ==3)
            {

                    // getchar();
                    expansion_pose.visualize(250/NUM_SMHA_HEUR*(ii+2));
                    // ContBaseState basestate = expansion_pose.getContBaseState();
                    // printf("x val %f\n", basestate.x());
                    // printf("y val %f\n", basestate.y());
                    // RightContArmState armState = state.right_arm();

                    // config->push_back(basestate.theta());
                }
        // source_state->robot_pose().visualize(250/NUM_SMHA_HEUR*ii);
        // m_cspace_mgr->visualizeAttachedObject(expansion_pose, 250/NUM_SMHA_HEUR*ii);
        // usleep(5000);
    }
    usleep(5000);
    ROS_DEBUG_NAMED(MPRIM_LOG, "EXPANDING SUCCESSORS\n");
    for (auto mprim : m_mprims.getMotionPrims()) {
        ROS_DEBUG_NAMED(SEARCH_LOG, "Applying motion:");
        // mprim->printEndCoord();
        GraphStatePtr successor;
        TransitionData t_data;
        if (!mprim->apply(*source_state, successor, t_data)) {
            ROS_DEBUG_NAMED(MPRIM_LOG, "couldn't apply mprim");
            continue;
        }

        if ((m_cspace_mgr->isValidSuccessor(*successor,t_data) &&
            m_cspace_mgr->isValidTransitionStates(t_data))){
            ROS_DEBUG_NAMED(SEARCH_LOG, "Source state is:");

            source_state->printToDebug(SEARCH_LOG);
            m_hash_mgr->save(successor);
            ROS_DEBUG_NAMED(MPRIM_LOG, "successor state with id %d is:",
                            successor->id());
            successor->printToDebug(MPRIM_LOG);

            if (m_goal->isSatisfiedBy(successor) || (mprim->motion_type() == MPrim_Types::ARM && m_goal->isSatisfiedByxyz(successor))){
                m_goal->storeAsSolnState(successor);
                ROS_DEBUG_NAMED(SEARCH_LOG, "Found potential goal at state %d %d", successor->id(),
                    mprim->cost());
                succIDs->push_back(GOAL_STATE);
            } else {
                succIDs->push_back(successor->id());
            }
            costs->push_back(mprim->cost());
            ROS_DEBUG_NAMED(SEARCH_LOG, "motion succeeded with cost %d", mprim->cost());
        } else {
            //successor->robot_pose().visualize();
            // ROS_INFO(SEARCH_LOG, "successor failed collision checking");
        }

    }
}

void Environment::getConfigforXYpose(std::vector<double>* config, RobotState state)
{
    ContBaseState basestate = state.getContBaseState();
    RightContArmState armState = state.right_arm();

    std::vector<double> angles;
    armState.getAngles(&angles);

    config->push_back(basestate.x());
    config->push_back(basestate.y());
    config->push_back(basestate.z());
    config->push_back(basestate.theta());

    for (int i=0;i<angles.size();i++)
     {
        config->push_back(angles[i]);
     }
     printf("\n");
}
void Environment::visualizeState(int stateID)
{
    GraphStatePtr state = m_hash_mgr->getGraphState(stateID);
    RobotState pose = state->robot_pose();
    pose.visualize(250/NUM_SMHA_HEUR*5);
    usleep(5000);
    // getchar();
}

void Environment::generateValidStateforState(int attractstateID, int repulstateID)
{
    // set_uniform_sampling = -1;
    // ContBaseState base;

    // GraphStatePtr attractstate = m_hash_mgr->getGraphState(attractstateID);
    // RobotState pose = attractstate->robot_pose();
    // base = pose.getContBaseState();


    // StartGoalGenerator generatorObject(m_cspace_mgr);
    // generatorObject.generateRandomValidState(attractivestate, base, -1, true);

    // attractivestate.visualize(250/NUM_SMHA_HEUR*2);

    // usleep(5000);
    // // getchar();

    // //updating repulsive state
    // GraphStatePtr repulstate = m_hash_mgr->getGraphState(repulstateID);
    // repulsivestate = repulstate->robot_pose();

}


void Environment::generateRandomValidState(int stateID, int h, int i)
{

    // ContBaseState base;

    // GraphStatePtr attractstate = m_hash_mgr->getGraphState(stateID);
    // RobotState pose = attractstate->robot_pose();
    // base = pose.getContBaseState();


    // StartGoalGenerator generatorObject(m_cspace_mgr);
    // int h_val = 10000000;

    // printf("i is %d\n", i);
    // switch (i){
    //     case 2:
    //     {
    //         while (h_val >= h || h_val < 0)
    //         {
    //             generatorObject.generateRandomValidState(attractivestate_endeff, base, -1, true);

    //             std::unique_ptr<stringintmap> values;
    //             attractstate = make_shared<GraphState>(attractivestate_endeff);
    //             m_heur_mgr->getGoalHeuristic(attractstate, values);
    //             h_val = EPS2*(*values).at("admissible_endeff");
    //             // printf("\t \t \t \t H found %d\n",h_val);
    //             attractivestate_endeff.visualize(250/NUM_SMHA_HEUR);
    //             usleep(5000);


    //         }
    //         // getchar();
    //     }
    //     case 3:
    //         while (h_val >= h || h_val < 0)
    //         {
    //             generatorObject.generateRandomValidState(attractivestate_base, base, -1, true);

    //             std::unique_ptr<stringintmap> values;
    //             attractstate = make_shared<GraphState>(attractivestate_base);
    //             m_heur_mgr->getGoalHeuristic(attractstate, values);
    //             h_val = EPS2*(*values).at("admissible_base");
    //             printf("\t \t \t \t H found %d\n",h_val);
    //             attractivestate_base.visualize(250/NUM_SMHA_HEUR*6);
    //             usleep(5000);
    //         }
    //         // getchar();
    // }

    //     //check h value


    //     printf("valid state generated\n");

    // GraphStatePtr repulstate = m_hash_mgr->getGraphState(stateID);
    // repulsivestate_combined = repulstate->robot_pose();
}

void Environment::generateTuckedState(RobotState& generated_state, ContBaseState base)
{
    double rad = 0.25;
    std::vector<double> r_angles(7,0);
    r_angles = {-0.2, 1.1072800, -1.5566882, -2.124408, 0.0, -1.57, 0.0};
    RightContArmState r_arm(r_angles);

    std::vector<double> l_angles(7,0);
    l_angles = {0.06024, 1.248526, 1.789070, -1.683386, -1.7343417, -0.0962141, -0.0864407};
    LeftContArmState l_arm(l_angles);

    double rand_angles[4] = {M_PI, -M_PI, M_PI/2, -M_PI/2};
    base.x(randomDouble(base.x()-rad, base.x()+rad));
    base.y(randomDouble(base.y()-rad, base.y()+rad));
    // base.theta(randomDouble(base.theta()-M_PI/12, base.theta()+M_PI/12));

    if (rand()%10>8)
        base.theta(randomDouble(-M_PI, M_PI));
    else
        base.theta(rand_angles[rand()%4]);

    generated_state.base_state(base);
    generated_state.right_arm(r_arm);
    generated_state.left_arm(l_arm);
    // attractivestate_combined.visualize(250/NUM_SMHA_HEUR);
    // usleep(5000);
}

int Environment::generateRandomValidStateCombined(int stateID_endeff, int stateID_base, int h_endeff, int h_base)
{

    ContBaseState base_endeff, base_base;

    GraphStatePtr attractstate = m_hash_mgr->getGraphState(stateID_endeff);
    RobotState pose_endeff = attractstate->robot_pose();
    base_endeff = pose_endeff.getContBaseState();

    attractstate = m_hash_mgr->getGraphState(stateID_base);
    pose_endeff = attractstate->robot_pose();
    base_base = pose_endeff.getContBaseState();

    double arm_xyz_weight_anchor = 40.0/0.02;




    StartGoalGenerator generatorObject(m_cspace_mgr);
    int h_val_endeff = 10000000;
    int h_val_base = 10000000;
    int timeout = 0;
    // printf("i is %d\n", i);
    samplingtimeout = false;

    if (/*h_endeff < h_base ||*/ h_base == 0)       //hack
    {
        hzero = true;

            ContObjectState goal_c = m_goal->getObjectState().getContObjectState();
            // printf("%f %f %f\n", goal_c.roll(), goal_c.pitch(), goal_c.yaw());
            // getchar();
            if(!generatorObject.generateRandomValidState(attractivestate_combined, base_endeff, m_goal->getObjectState(), -1, true))
                return 10;


            GraphStatePtr repulstate = m_hash_mgr->getGraphState(stateID_endeff);
            repulsivestate_combined = repulstate->robot_pose();
            return 1;
    }
    else
    {
        static bool toggle = true;
        toggle = !toggle;
        if (toggle)
            do
            {
                h_val_endeff = 10000000;
                while (h_val_endeff >= h_endeff || h_val_endeff < 0)
                {
                    timeout++;
                    double diff;
                    // RobotState expansion_pose = successor->robot_pose();
                    ContObjectState s1 = pose_endeff.getObjectStateRelMap();
                    ContObjectState s2 = m_goal->getObjectState().getContObjectState();
                    diff = arm_xyz_weight_anchor*pow(pow((s1.x()-s2.x()),2)+pow(s1.y()-s2.y(),2)+pow(s1.z()-s2.z(),2),.5);

                    generateTuckedState(attractivestate_combined, base_endeff);

                    std::unique_ptr<stringintmap> values;
                    attractstate = make_shared<GraphState>(attractivestate_combined);

                    m_heur_mgr->getGoalHeuristic(attractstate, values);

                    h_val_endeff = std::max((*values).at("admissible_base"),(int)diff);
                    // attractivestate_combined.visualize(250/NUM_SMHA_HEUR);
                    // usleep(5000);
                    if (timeout>50)
                    {

                       do
                        {

                            h_val_base = 10000000;
                            while (h_val_base >= h_base || h_val_base < 0)
                            {

                                generateTuckedState(attractivestate_combined, base_base);

                                std::unique_ptr<stringintmap> values;
                                attractstate = make_shared<GraphState>(attractivestate_combined);

                                m_heur_mgr->getGoalHeuristic(attractstate, values);

                                h_val_base = (*values).at("admissible_base");


                                // printf("\t \t \t \t H found %d\n",h_val);
                            }
                        }
                        while (m_cspace_mgr->isValid(attractivestate_combined));
                        break;
                    }
                }
            }
            while (m_cspace_mgr->isValid(attractivestate_combined));
        else
            do
            {

                h_val_base = 10000000;
                while (h_val_base >= h_base || h_val_base < 0)
                {

                    generateTuckedState(attractivestate_combined, base_base);

                    std::unique_ptr<stringintmap> values;
                    attractstate = make_shared<GraphState>(attractivestate_combined);

                    m_heur_mgr->getGoalHeuristic(attractstate, values);

                    h_val_base = (*values).at("admissible_base");



                    // printf("\t \t \t \t H found %d\n",h_val);
                }
            }
            while (m_cspace_mgr->isValid(attractivestate_combined));
        // attractivestate_combined.visualize(250/NUM_SMHA_HEUR);
        // usleep(5000);
        GraphStatePtr repulstate = m_hash_mgr->getGraphState(stateID_base);
        repulsivestate_combined = repulstate->robot_pose();
        return 2;
    }

}
bool Environment::setStartGoal(SearchRequestPtr search_request,
                               int& start_id, int& goal_id){
    RobotState start_pose(search_request->m_params->base_start,
                         search_request->m_params->right_arm_start,
                         search_request->m_params->left_arm_start);
    ContObjectState obj_state = start_pose.getObjectStateRelMap();
    obj_state.printToInfo(SEARCH_LOG);

    if (!search_request->isValid(m_cspace_mgr)){
        obj_state.printToInfo(SEARCH_LOG);
        //start_pose.visualize();
        return false;
    }

    // start_pose.visualize();
    // m_cspace_mgr->visualizeAttachedObject(start_pose);
    // std::cin.get();

    GraphStatePtr start_graph_state = make_shared<GraphState>(start_pose);
    m_hash_mgr->save(start_graph_state);
    start_id = start_graph_state->id();
    assert(m_hash_mgr->getGraphState(start_graph_state->id()) == start_graph_state);

    ROS_INFO_NAMED(SEARCH_LOG, "Start state set to:");
    start_pose.printToInfo(SEARCH_LOG);
    obj_state.printToInfo(SEARCH_LOG);
    // start_pose.visualize();


    m_goal = search_request->createGoalState();

    if (m_hash_mgr->size() < 2){
        goal_id = saveFakeGoalState(start_graph_state);
    } else {
        goal_id = 1;
    }

    ROS_INFO_NAMED(SEARCH_LOG, "Goal state created:");
    ContObjectState c_goal = m_goal->getObjectState();
    c_goal.printToInfo(SEARCH_LOG);
    m_goal->visualize();

    // This informs the adaptive motions about the goal.
    ArmAdaptiveMotionPrimitive::goal(*m_goal);
    BaseAdaptiveMotionPrimitive::goal(*m_goal);

    // informs the heuristic about the goal
    m_heur_mgr->setGoal(*m_goal);

    return true;
}

// a hack to reserve a goal id in the hash so that no real graph state is ever
// saved as the goal state id
int Environment::saveFakeGoalState(const GraphStatePtr& start_graph_state){
    GraphStatePtr fake_goal = make_shared<GraphState>(*start_graph_state);
    RobotState fake_robot_state = fake_goal->robot_pose();
    DiscBaseState fake_base = fake_robot_state.base_state();
    fake_base.x(0); fake_base.y(0); fake_base.z(0);
    fake_robot_state.base_state(fake_base);
    fake_goal->robot_pose(fake_robot_state);
    m_hash_mgr->save(fake_goal);
    int goal_id = fake_goal->id();
    assert(goal_id == GOAL_STATE);
    return goal_id;
}

// this sets up the environment for things that are query independent.
void Environment::configurePlanningDomain(){
    // used for collision space and discretizing plain xyz into grid world
    OccupancyGridUser::init(m_param_catalog.m_occupancy_grid_params,
                        m_param_catalog.m_robot_resolution_params);


    // used for discretization of robot movements
    ContArmState::setRobotResolutionParams(m_param_catalog.m_robot_resolution_params);

#ifdef USE_IKFAST_SOLVER
    ROS_DEBUG_NAMED(CONFIG_LOG, "Using IKFast");
#endif
#ifdef USE_KDL_SOLVER
    ROS_DEBUG_NAMED(CONFIG_LOG, "Using KDL");
#endif

    // Initialize the heuristics. The (optional) parameter defines the cost multiplier.

    m_heur_mgr->initializeHeuristics();

    // used for arm kinematics
    LeftContArmState::initArmModel(m_param_catalog.m_left_arm_params);
    RightContArmState::initArmModel(m_param_catalog.m_right_arm_params);

    // collision space mgr needs arm models in order to do collision checking
    // have to do this funny thing of initializing an object because of static
    // variable + inheritance (see ContArmState for details)
    LeftContArmState l_arm;
    RightContArmState r_arm;
    m_cspace_mgr = make_shared<CollisionSpaceMgr>(r_arm.getArmModel(),
                                                  l_arm.getArmModel());
    m_heur_mgr->setCollisionSpaceMgr(m_cspace_mgr);
    // load up motion primitives
    m_mprims.loadMPrims(m_param_catalog.m_motion_primitive_params);

    // load up static pviz instance for visualizations.
    Visualizer::createPVizInstance();
    Visualizer::setReferenceFrame(std::string("/map"));
}

// sets parameters for query specific things
void Environment::configureQuerySpecificParams(SearchRequestPtr search_request){
    // sets the location of the object in the frame of the wrist
    // have to do this funny thing of initializing an object because of static
    // variable + inheritance (see ContArmState for details)
    LeftContArmState l_arm;
    RightContArmState r_arm;
    l_arm.setObjectOffset(search_request->m_params->left_arm_object);
    r_arm.setObjectOffset(search_request->m_params->right_arm_object);
    ROS_DEBUG_NAMED(SEARCH_LOG, "Setting planning mode to : %d",
        search_request->m_params->planning_mode);
    RobotState::setPlanningMode(search_request->m_params->planning_mode);
}

/*! \brief Given the solution path containing state IDs, reconstruct the
* actual corresponding robot states. This also makes the path smooth in between
* each state id because we add in the intermediate states given by the
* transition data.
*/
vector<FullBodyState> Environment::reconstructPath(vector<int> soln_path){
    PathPostProcessor postprocessor(m_hash_mgr, m_cspace_mgr);
    std::vector<FullBodyState> final_path = postprocessor.reconstructPath(soln_path, *m_goal, m_mprims.getMotionPrims());
    if(m_param_catalog.m_visualization_params.final_path){
        // postprocessor.visualizeFinalPath(final_path);
    }
    return final_path;
}

void Environment::generateStartState(SearchRequestPtr search_request) {
    ContObjectState start_obj_state(search_request->m_params->obj_start);
    ContBaseState base_start(search_request->m_params->base_start);
    RobotState start_robot_state(base_start, start_obj_state);
    // start_robot_state.visualize();
    // m_cspace_mgr->visualizeAttachedObject(start_robot_state);
    ROS_DEBUG_NAMED(CONFIG_LOG, "Generate start state : Keyboard");
    // std::cin.get();
    search_request->m_params->base_start = start_robot_state.getContBaseState();
    search_request->m_params->right_arm_start = start_robot_state.right_arm();
    search_request->m_params->left_arm_start = start_robot_state.left_arm();
}
