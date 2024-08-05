extends Node2D

@export var water_material : Material
var time : float = 0.0

func _process(delta: float) -> void:
    time += delta * 0.1
    water_material.set_shader_param("time", time)
