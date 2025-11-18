/*
 * Original work Copyright 2024 LiveKit, Inc.
 * Modifications Copyright 2025 Eleven Labs Inc.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import Foundation
import LiveKit

/// A richer agent state enum specifically for visualizer animations.
/// This enum preserves the full set of states needed for detailed visual feedback,
/// independent of the simplified SDK's `AgentState` enum.
public enum VisualizerAgentState: Sendable, Equatable {
    /// Agent is connecting to the session
    case connecting
    /// Agent is initializing
    case initializing
    /// Agent is listening to user input
    case listening
    /// Agent is processing/thinking
    case thinking
    /// Agent is speaking
    case speaking
    /// Agent is disconnected
    case disconnected
    /// Unknown or unspecified state
    case unknown

    /// Initialize from SDK's AgentState, mapping simplified states to visualizer states
    public init(from sdkState: AgentState) {
        switch sdkState {
        case .listening:
            self = .listening
        case .speaking:
            self = .speaking
        @unknown default:
            self = .unknown
        }
    }
}
