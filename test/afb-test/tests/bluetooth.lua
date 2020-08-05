--[[
 Copyright 2019 Konsulko Group

 author:Edi Feschiyan <edi.feschiyan@konsulko.com>

 Licensed under the Apache License, Version 2.0 (the "License");
 you may not use this file except in compliance with the License.
 You may obtain a copy of the License at

     http://www.apache.org/licenses/LICENSE-2.0

 Unless required by applicable law or agreed to in writing, software
 distributed under the License is distributed on an "AS IS" BASIS,
 WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 See the License for the specific language governing permissions and
 limitations under the License.
--]]


-- Default Adapter test
_AFT.testVerbStatusSuccess('testBtDefaultAdapterSuccess','Bluetooth-Manager','default_adapter', {})

-- Subscription tests
_AFT.testVerbStatusSuccess('testBtSubscribeDevChgSuccess','Bluetooth-Manager','subscribe', {value="device_changes"})  
_AFT.testVerbStatusSuccess('testBtSubscribeAdpChgSuccess','Bluetooth-Manager','subscribe', {value="adapter_changes"}) 
_AFT.testVerbStatusSuccess('testBtSubscribeMediaSuccess','Bluetooth-Manager','subscribe', {value="media"})
_AFT.testVerbStatusSuccess('testBtSubscribeAgentSuccess','Bluetooth-Manager','subscribe', {value="agent"})

-- Unsubscription tests
_AFT.testVerbStatusSuccess('testBtUnSubscribeDevChgSuccess','Bluetooth-Manager','unsubscribe', {value="device_changes"})  
_AFT.testVerbStatusSuccess('testBtUnSubscribeAdpChgSuccess','Bluetooth-Manager','unsubscribe', {value="adapter_changes"}) 
_AFT.testVerbStatusSuccess('testBtUnSubscribeMediaSuccess','Bluetooth-Manager','unsubscribe', {value="media"})
_AFT.testVerbStatusSuccess('testBtUnSubscribeAgentSuccess','Bluetooth-Manager','unsubscribe', {value="agent"})

-- Managed objects test
_AFT.testVerbStatusSuccess('testBtManagedObjsSuccess','Bluetooth-Manager','managed_objects', {})

-- Adapter state test
_AFT.testVerbStatusSuccess('testBtAdpStateSuccess','Bluetooth-Manager','adapter_state', {})

-- Pair test - requires valid bluetooth adapter 
-- _AFT.testVerbStatusSuccess('testBtPairSuccess','Bluetooth-Manager','pair', {device="dev_01_23_45_67_89_0A"})

-- Cancel pairing test - cancel an ongoing pairing
-- _AFT.testVerbStatusSuccess('testBtCancelPairSuccess', 'Bluetooth-Manager', 'cancel_pairing', {})

-- Confirm pairing test - confirm incoming/outgoing bluetooth pairing pincode
-- _AFT.testVerbStatusSuccess('testBtConfirmPairSuccess', 'Bluetooth-Manager', 'confirm_pairing', {pincode="31415"})

-- Remove device test - remove already paired device
-- _AFT.testVerbStatusSuccess('testBtRemoveDeviceSuccess', 'Bluetooth-Manager', 'remove_device', {device="dev_01_23_45_67_89_0A"})

-- Connect to a paired device test - connect to already paired device
-- _AFT.testVerbStatusSuccess('testBtConnectSuccess', 'Bluetooth-Manager', 'connect', {device="dev_01_23_45_67_89_0A"})

-- avrcp_controls test -- requied connected to a smart phone
-- _AFT.testVerbStatusSuccess('testBtConnectSuccess', 'Bluetooth-Manager', 'avrcp_controls', {action="Play"})
-- _AFT.testVerbStatusSuccess('testBtConnectSuccess', 'Bluetooth-Manager', 'avrcp_controls', {action="Pause"})
-- _AFT.testVerbStatusSuccess('testBtConnectSuccess', 'Bluetooth-Manager', 'avrcp_controls', {action="Stop"})
-- _AFT.testVerbStatusSuccess('testBtConnectSuccess', 'Bluetooth-Manager', 'avrcp_controls', {action="Next"})
-- _AFT.testVerbStatusSuccess('testBtConnectSuccess', 'Bluetooth-Manager', 'avrcp_controls', {action="Previous"})
-- _AFT.testVerbStatusSuccess('testBtConnectSuccess', 'Bluetooth-Manager', 'avrcp_controls', {action="FastForward"})
-- _AFT.testVerbStatusSuccess('testBtConnectSuccess', 'Bluetooth-Manager', 'avrcp_controls', {action="Rewind"})

-- Disconnect to a connected device test
-- _AFT.testVerbStatusSuccess('testBtDisConnectSuccess', 'Bluetooth-Manager', 'disconnect', {device="dev_01_23_45_67_89_0A"})
