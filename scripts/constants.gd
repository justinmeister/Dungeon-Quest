extends Node

### All my state and other constants. It's called just c in the global
### variable just for simplicity. So just write c.CONSTANT to access a
### constant.



const IDLE = "idle"
const IDLE_RIGHT = "idle_right"
const IDLE_LEFT = "idle_left"
const RUN = "run"
const RUN_RIGHT = "run_right"
const RUN_LEFT = "run_left"
const JUMP = "jump"
const DOUBLE_JUMP = "double_jump"
const JUMP_RIGHT = "jump_right"
const JUMP_LEFT = "jump_left"
const DOUBLE_JUMP_RIGHT = "double_jump_right"
const DOUBLE_JUMP_LEFT = "double_jump_left"
const FALL = "fall"
const GROUND_ATTACK = "ground_attack"
const JUMP_ATTACK = "jump attack"
const MAKE_BIG = "make big"
const SWORD_COLLISION = "sword_collision"
const RIGHT_GROUND_ATTACK = "right_ground_attack"
const LEFT_GROUND_ATTACK = "left_ground_attack"
const HIT = "hit"

const WALK = "walk"
const ATTACK1 = "attack1"
const ATTACK2 = "attack2"
const DIE = "die"
const HURT = "hurt"
const STAND_UP = "stand_up"
const BONE_PILE = "bone_pile"
const DOUBLE_ATTACK = "double_attack"
const DOUBLE_ATTACK_LEFT = "double_attack_left"

const MAX_SPEED: float = 100.0
const JUMP_VELOCITY: float = -300.0
const DOUBLE_JUMP_VELOCITY: float = -330.0
const RUN_ACCEL: float = 20.0
const SKELETON_DEATH_TIME: float = 1.0
const SKELETON_START_HEALTH: int = 1
const DOUBLE_JUMP_WAIT_TIME: float = 0.2
const JUMP_BUFFER_WAIT_TIME: float = 0.2

const LEVEL_1_PATH = "res://scenes/Levels/level_1.tscn"
const LEVEL_2_PATH = "res://scenes/levels/level_2.tscn"
