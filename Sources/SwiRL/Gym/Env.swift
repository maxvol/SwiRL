//
//  Env.swift
//
//
//  Created by Maxim Volgin on 24/03/2024.
//

import Foundation

//env.unwrapped.action_space
//env.unwrapped.observation_space
//env.unwrapped.P

protocol Env {
    var reward_range: Range<Double> { get }
    
    var np_random: Double { get } // TODO: RNG
    
    var metadata: Double { get } // TODO: ?
    
    var spec: Double { get } // TODO: ?
    
    func reset(seed: Int)
    func render()
    func close()

    
    // state, info = env.reset(seed=42)
    
//    env.unwrapped.P[state][action]
    // terminal_state, num_states, policy, gamma
/*
    if state == terminal_state:
        return 0
    action = policy[state]
    _, next_state, reward, _ = env.unwrapped.P[state][action][0]
    return reward + gamma * compute_state_value(next_state)
*/
    //   state, reward, terminated, truncated, info = env.step(action)
//    render()
}

protocol SAEnv: Env {
    var action_space: Space { get }
    var observation_space: Space { get }
    var P: [[Double]] { get }
    
    func step()
    /*
    step() - Updates an environment with actions returning the next agent observation, the reward for taking that actions, if the environment has terminated or truncated due to the latest action and information from the environment about the step, i.e. metrics, debug info.

    reset() - Resets the environment to an initial state, required before calling step. Returns the first agent observation for an episode and information, i.e. metrics, debug info.

    render() - Renders the environments to help visualise what the agent see, examples modes are “human”, “rgb_array”, “ansi” for text.

    close() - Closes the environment, important when external software is used, i.e. pygame for rendering, databases

    Environments have additional attributes for users to understand the implementation

    action_space - The Space object corresponding to valid actions, all valid actions should be contained within the space.

    observation_space - The Space object corresponding to valid observations, all valid observations should be contained within the space.

    reward_range - A tuple corresponding to the minimum and maximum possible rewards for an agent over an episode. The default reward range is set to
    .

    spec - An environment spec that contains the information used to initialize the environment from gymnasium.make()

    metadata - The metadata of the environment, i.e. render modes, render fps

    np_random - The random number generator for the environment. This is automatically assigned during super().reset(seed=seed) and when assessing self.np_random.
    */
}

/*
 import gymnasium as gym
 env = gym.make("LunarLander-v2", render_mode="human")
 observation, info = env.reset()

 for _ in range(1000):
     action = env.action_space.sample()  # agent policy that uses the observation and info
     observation, reward, terminated, truncated, info = env.step(action)

     if terminated or truncated:
         observation, info = env.reset()

 env.close()
 */

protocol MAEnv: Env {
    var agents: [Agent] { get }
    var num_agents: Int { get }
    var agent_selection: Int { get }
    func observation_space(agent: Agent)
    func action_space(agent: Agent)
    /*
     agents: A list of the names of all current agents, typically integers. These may be changed as an environment progresses (i.e. agents can be added or removed).

     num_agents: The length of the agents list.

     agent_selection an attribute of the environment corresponding to the currently selected agent that an action can be taken for.

     observation_space(agent) a function that retrieves the observation space for a particular agent. This space should never change for a particular agent ID.

     action_space(agent) a function that retrieves the action space for a particular agent. This space should never change for a particular agent ID.

     terminations: A dict of the termination state of every current agent at the time called, keyed by name. last() accesses this attribute. Note that agents can be added or removed from this dict. The returned dict looks like:

     terminations = {0:[first agent's termination state], 1:[second agent's termination state] ... n-1:[nth agent's termination state]}

     truncations: A dict of the truncation state of every current agent at the time called, keyed by name. last() accesses this attribute. Note that agents can be added or removed from this dict. The returned dict looks like:

     truncations = {0:[first agent's truncation state], 1:[second agent's truncation state] ... n-1:[nth agent's truncation state]}

     infos: A dict of info for each current agent, keyed by name. Each agent’s info is also a dict. Note that agents can be added or removed from this attribute. last() accesses this attribute. The returned dict looks like:

     infos = {0:[first agent's info], 1:[second agent's info] ... n-1:[nth agent's info]}

     observe(agent): Returns the observation an agent currently can make. last() calls this function.

     rewards: A dict of the rewards of every current agent at the time called, keyed by name. Rewards the instantaneous reward generated after the last step. Note that agents can be added or removed from this attribute. last() does not directly access this attribute, rather the returned reward is stored in an internal variable. The rewards structure looks like:

     {0:[first agent's reward], 1:[second agent's reward] ... n-1:[nth agent's reward]}

     seed(seed=None): Reseeds the environment. reset() must be called after seed(), and before step().

     render(): Returns a rendered frame from the environment using render mode specified at initialization. In the case render mode is'rgb_array', returns a numpy array, while with 'ansi' returns the strings printed. There is no need to call render() with human mode.

     close(): Closes the rendering window.

     Optional API Components
     While not required by the base API, most downstream wrappers and utilities depend on the following attributes and methods, and they should be added to new environments except in special circumstances where adding one or more is not possible.

     possible_agents: A list of all possible_agents the environment could generate. Equivalent to the list of agents in the observation and action spaces. This cannot be changed through play or resetting.

     max_num_agents: The length of the possible_agents list.

     observation_spaces: A dict of the observation spaces of every agent, keyed by name. This cannot be changed through play or resetting.

     action_spaces: A dict of the action spaces of every agent, keyed by name. This cannot be changed through play or resetting.

     state(): Returns a global observation of the current state of the environment. Not all environments will support this feature.

     state_space: The space of a global observation of the environment. Not all environments will support this feature.
     */
    
}

/*
 from pettingzoo.butterfly import cooperative_pong_v5

 env = cooperative_pong_v5.env(render_mode="human")
 env.reset(seed=42)

 for agent in env.agent_iter():
     observation, reward, termination, truncation, info = env.last()

     if termination or truncation:
         action = None
     else:
         # this is where you would insert your policy
         action = env.action_space(agent).sample()

     env.step(action)
 env.close()
 */
