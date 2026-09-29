
"use strict";

let VehicleCollision = require('./VehicleCollision.js');
let EgoVehicleStatus = require('./EgoVehicleStatus.js');
let RobotOutput = require('./RobotOutput.js');
let SkidSteer6wUGVStatus = require('./SkidSteer6wUGVStatus.js');
let SkateboardStatus = require('./SkateboardStatus.js');
let ObjectStatus = require('./ObjectStatus.js');
let GeoVector3Message = require('./GeoVector3Message.js');
let Conveyor = require('./Conveyor.js');
let NpcGhostCmd = require('./NpcGhostCmd.js');
let ExternalForce = require('./ExternalForce.js');
let WheelControl = require('./WheelControl.js');
let MultiPlayEventRequest = require('./MultiPlayEventRequest.js');
let CtrlCmd = require('./CtrlCmd.js');
let CMDConveyor = require('./CMDConveyor.js');
let SyncModeSetGear = require('./SyncModeSetGear.js');
let Obstacle = require('./Obstacle.js');
let SyncModeCmd = require('./SyncModeCmd.js');
let ObjectStatusListExtended = require('./ObjectStatusListExtended.js');
let SetTrafficLight = require('./SetTrafficLight.js');
let FaultInjection_Sensor = require('./FaultInjection_Sensor.js');
let IntscnTL = require('./IntscnTL.js');
let PREvent = require('./PREvent.js');
let EgoDdVehicleStatus = require('./EgoDdVehicleStatus.js');
let MoraiSimProcStatus = require('./MoraiSimProcStatus.js');
let FaultStatusInfo_Overall = require('./FaultStatusInfo_Overall.js');
let WoowaDillyStatus = require('./WoowaDillyStatus.js');
let MapSpecIndex = require('./MapSpecIndex.js');
let Transforms = require('./Transforms.js');
let PRCtrlCmd = require('./PRCtrlCmd.js');
let SyncModeResultResponse = require('./SyncModeResultResponse.js');
let GPSMessage = require('./GPSMessage.js');
let IntersectionControl = require('./IntersectionControl.js');
let EgoVehicleStatusExtended = require('./EgoVehicleStatusExtended.js');
let ObjectStatusExtended = require('./ObjectStatusExtended.js');
let GetTrafficLightStatus = require('./GetTrafficLightStatus.js');
let SyncModeCmdResponse = require('./SyncModeCmdResponse.js');
let MultiEgoSetting = require('./MultiEgoSetting.js');
let SensorPosControl = require('./SensorPosControl.js');
let MoraiSimProcHandle = require('./MoraiSimProcHandle.js');
let SyncModeRemoveObject = require('./SyncModeRemoveObject.js');
let SyncModeAddObject = require('./SyncModeAddObject.js');
let MultiPlayEventResponse = require('./MultiPlayEventResponse.js');
let IntersectionStatus = require('./IntersectionStatus.js');
let MapSpec = require('./MapSpec.js');
let SyncModeInfo = require('./SyncModeInfo.js');
let GVDirectCmd = require('./GVDirectCmd.js');
let FaultStatusInfo = require('./FaultStatusInfo.js');
let DdCtrlCmd = require('./DdCtrlCmd.js');
let Obstacles = require('./Obstacles.js');
let SVADC = require('./SVADC.js');
let FaultStatusInfo_Sensor = require('./FaultStatusInfo_Sensor.js');
let VehicleCollisionData = require('./VehicleCollisionData.js');
let Lamps = require('./Lamps.js');
let FaultInjection_Tire = require('./FaultInjection_Tire.js');
let CollisionData = require('./CollisionData.js');
let SaveSensorData = require('./SaveSensorData.js');
let MoraiSrvResponse = require('./MoraiSrvResponse.js');
let RobotState = require('./RobotState.js');
let MoraiTLInfo = require('./MoraiTLInfo.js');
let RadarDetection = require('./RadarDetection.js');
let EventInfo = require('./EventInfo.js');
let FaultInjection_Response = require('./FaultInjection_Response.js');
let DillyCmdResponse = require('./DillyCmdResponse.js');
let SkateboardCtrlCmd = require('./SkateboardCtrlCmd.js');
let FaultInjection_Controller = require('./FaultInjection_Controller.js');
let SyncModeCtrlCmd = require('./SyncModeCtrlCmd.js');
let GhostMessage = require('./GhostMessage.js');
let DillyCmd = require('./DillyCmd.js');
let ManipulatorControl = require('./ManipulatorControl.js');
let VehicleSpecIndex = require('./VehicleSpecIndex.js');
let FaultStatusInfo_Vehicle = require('./FaultStatusInfo_Vehicle.js');
let ERP42Info = require('./ERP42Info.js');
let WaitForTick = require('./WaitForTick.js');
let VehicleSpec = require('./VehicleSpec.js');
let GVStateCmd = require('./GVStateCmd.js');
let MoraiTLIndex = require('./MoraiTLIndex.js');
let SyncModeScenarioLoad = require('./SyncModeScenarioLoad.js');
let SkidSteer6wUGVCtrlCmd = require('./SkidSteer6wUGVCtrlCmd.js');
let UGVServeSkidCtrlCmd = require('./UGVServeSkidCtrlCmd.js');
let TrafficLight = require('./TrafficLight.js');
let ObjectStatusList = require('./ObjectStatusList.js');
let TOF = require('./TOF.js');
let ReplayInfo = require('./ReplayInfo.js');
let ScenarioLoad = require('./ScenarioLoad.js');
let WaitForTickResponse = require('./WaitForTickResponse.js');
let ShipState = require('./ShipState.js');
let PRStatus = require('./PRStatus.js');
let RadarDetections = require('./RadarDetections.js');
let VelocityCmd = require('./VelocityCmd.js');
let ShipCtrlCmd = require('./ShipCtrlCmd.js');
let NpcGhostInfo = require('./NpcGhostInfo.js');

module.exports = {
  VehicleCollision: VehicleCollision,
  EgoVehicleStatus: EgoVehicleStatus,
  RobotOutput: RobotOutput,
  SkidSteer6wUGVStatus: SkidSteer6wUGVStatus,
  SkateboardStatus: SkateboardStatus,
  ObjectStatus: ObjectStatus,
  GeoVector3Message: GeoVector3Message,
  Conveyor: Conveyor,
  NpcGhostCmd: NpcGhostCmd,
  ExternalForce: ExternalForce,
  WheelControl: WheelControl,
  MultiPlayEventRequest: MultiPlayEventRequest,
  CtrlCmd: CtrlCmd,
  CMDConveyor: CMDConveyor,
  SyncModeSetGear: SyncModeSetGear,
  Obstacle: Obstacle,
  SyncModeCmd: SyncModeCmd,
  ObjectStatusListExtended: ObjectStatusListExtended,
  SetTrafficLight: SetTrafficLight,
  FaultInjection_Sensor: FaultInjection_Sensor,
  IntscnTL: IntscnTL,
  PREvent: PREvent,
  EgoDdVehicleStatus: EgoDdVehicleStatus,
  MoraiSimProcStatus: MoraiSimProcStatus,
  FaultStatusInfo_Overall: FaultStatusInfo_Overall,
  WoowaDillyStatus: WoowaDillyStatus,
  MapSpecIndex: MapSpecIndex,
  Transforms: Transforms,
  PRCtrlCmd: PRCtrlCmd,
  SyncModeResultResponse: SyncModeResultResponse,
  GPSMessage: GPSMessage,
  IntersectionControl: IntersectionControl,
  EgoVehicleStatusExtended: EgoVehicleStatusExtended,
  ObjectStatusExtended: ObjectStatusExtended,
  GetTrafficLightStatus: GetTrafficLightStatus,
  SyncModeCmdResponse: SyncModeCmdResponse,
  MultiEgoSetting: MultiEgoSetting,
  SensorPosControl: SensorPosControl,
  MoraiSimProcHandle: MoraiSimProcHandle,
  SyncModeRemoveObject: SyncModeRemoveObject,
  SyncModeAddObject: SyncModeAddObject,
  MultiPlayEventResponse: MultiPlayEventResponse,
  IntersectionStatus: IntersectionStatus,
  MapSpec: MapSpec,
  SyncModeInfo: SyncModeInfo,
  GVDirectCmd: GVDirectCmd,
  FaultStatusInfo: FaultStatusInfo,
  DdCtrlCmd: DdCtrlCmd,
  Obstacles: Obstacles,
  SVADC: SVADC,
  FaultStatusInfo_Sensor: FaultStatusInfo_Sensor,
  VehicleCollisionData: VehicleCollisionData,
  Lamps: Lamps,
  FaultInjection_Tire: FaultInjection_Tire,
  CollisionData: CollisionData,
  SaveSensorData: SaveSensorData,
  MoraiSrvResponse: MoraiSrvResponse,
  RobotState: RobotState,
  MoraiTLInfo: MoraiTLInfo,
  RadarDetection: RadarDetection,
  EventInfo: EventInfo,
  FaultInjection_Response: FaultInjection_Response,
  DillyCmdResponse: DillyCmdResponse,
  SkateboardCtrlCmd: SkateboardCtrlCmd,
  FaultInjection_Controller: FaultInjection_Controller,
  SyncModeCtrlCmd: SyncModeCtrlCmd,
  GhostMessage: GhostMessage,
  DillyCmd: DillyCmd,
  ManipulatorControl: ManipulatorControl,
  VehicleSpecIndex: VehicleSpecIndex,
  FaultStatusInfo_Vehicle: FaultStatusInfo_Vehicle,
  ERP42Info: ERP42Info,
  WaitForTick: WaitForTick,
  VehicleSpec: VehicleSpec,
  GVStateCmd: GVStateCmd,
  MoraiTLIndex: MoraiTLIndex,
  SyncModeScenarioLoad: SyncModeScenarioLoad,
  SkidSteer6wUGVCtrlCmd: SkidSteer6wUGVCtrlCmd,
  UGVServeSkidCtrlCmd: UGVServeSkidCtrlCmd,
  TrafficLight: TrafficLight,
  ObjectStatusList: ObjectStatusList,
  TOF: TOF,
  ReplayInfo: ReplayInfo,
  ScenarioLoad: ScenarioLoad,
  WaitForTickResponse: WaitForTickResponse,
  ShipState: ShipState,
  PRStatus: PRStatus,
  RadarDetections: RadarDetections,
  VelocityCmd: VelocityCmd,
  ShipCtrlCmd: ShipCtrlCmd,
  NpcGhostInfo: NpcGhostInfo,
};
