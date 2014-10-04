#pragma once
#include <ros/ros.h>
#include <sbpl/headers.h>
#include <monolithic_pr2_planner/ParameterCatalog.h>
#include <monolithic_pr2_planner/CollisionSpaceMgr.h>
#include <monolithic_pr2_planner/HashManager.h>
#include <monolithic_pr2_planner/SearchRequest.h>
#include <monolithic_pr2_planner/StateReps/GoalState.h>
#include <monolithic_pr2_planner/MotionPrimitives/MotionPrimitivesMgr.h>
#include <monolithic_pr2_planner/Heuristics/HeuristicMgr.h>
#include <monolithic_pr2_planner/PathPostProcessor.h>
#include <stdexcept>
#include <vector>
#include <memory>

#include <monolithic_pr2_planner/ExperimentFramework/randomStartGoalGenerator.h>    //fahad

#define NUM_SMHA_HEUR 3 // Used in EnvInterfaces to initialize the planner.
#define NUM_IMHA_HEUR 4 // Used in EnvInterfaces to initialize the planner.
// This should include the Anchor search -> Total number of searches.

#define EPS1 25
#define EPS2 4

namespace monolithic_pr2_planner {
    /*! \brief Implements a complete environment used by the SBPL planner.
     * Contains everything from managing state IDs to collision space
     * information.
     */
    class Environment : public DiscreteSpaceInformation {
        public:
            Environment(ros::NodeHandle nh);
            void passKeyValue(int val, int g);   //fahad
            CSpaceMgrPtr getCollisionSpace(){ return m_cspace_mgr; };
            HeuristicMgrPtr getHeuristicMgr(){ return m_heur_mgr; };
            bool configureRequest(SearchRequestParamsPtr search_request_params,
                                  int& start_id, int& goal_id);
            void GetSuccs(int sourceStateID, vector<int>* succIDs,
                          vector<int>* costs);
            void GetSuccs(int sourceStateID, vector<int>* succIDs,
                          vector<int>* costs, int ii);
            void getConfigforXYpose(std::vector<double>* config, RobotState state); //fahad
            void visualizeState(int stateID);  //fahad
            void generateValidStateforState(int attractstateID, int repulstateID); //fahad
            void generateRandomValidState(int stateID, int h, int i); //fahad
            int generateRandomValidStateCombined(int stateID_endeff, int stateID_base, int h_endeff, int h_base); //fahad
            void generateTuckedState(RobotState& generated_state, ContBaseState base);    //fahad
            inline double randomDouble(double min, double max){
                return min + (max-min) * ( double(rand()) / RAND_MAX );
            }
            std::vector<FullBodyState> reconstructPath(std::vector<int>
                state_ids);
            void reset();
            void setPlannerType(int planner_type);

        protected:
            bool setStartGoal(SearchRequestPtr search_request,
                              int& start_id, int& goal_id);
            int saveFakeGoalState(const GraphStatePtr& graph_state);
            void configurePlanningDomain();
            void configureQuerySpecificParams(SearchRequestPtr search_request);
            void generateStartState(SearchRequestPtr search_request);

            ParameterCatalog m_param_catalog;
            CSpaceMgrPtr m_cspace_mgr;
            HashManagerPtr m_hash_mgr;
            ros::NodeHandle m_nodehandle;
            GoalStatePtr m_goal;
            MotionPrimitivesMgr m_mprims;
            HeuristicMgrPtr m_heur_mgr;

            int m_planner_type;

            // RobotState repulsivestate, attractivestate;
        // SBPL interface stuff
        public:
            bool InitializeEnv(const char* sEnvFile){return false;};
            bool InitializeMDPCfg(MDPConfig *MDPCfg){ return true; };
            int  GetFromToHeuristic(int FromStateID, int ToStateID){ throw std::runtime_error("unimplement");  };
            int  GetGoalHeuristic(int stateID);
            int  GetGoalHeuristic(int stateID, int goal_id);
            int  GetStartHeuristic(int stateID) { throw std::runtime_error("unimplement"); };
            void GetPreds(int TargetStateID, std::vector<int>* PredIDV, std::vector<int>* CostV){};
            void SetAllActionsandAllOutcomes(CMDPSTATE* state){};
            void SetAllPreds(CMDPSTATE* state){};
            int  SizeofCreatedEnv(){ return m_hash_mgr->size(); };
            void PrintState(int stateID, bool bVerbose, FILE* fOut=NULL){};
            void PrintEnv_Config(FILE* fOut){};
    };
}
