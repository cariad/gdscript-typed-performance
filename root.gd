extends Node

const ITERATIONS: int = 1_000_000_000

@onready var label: Label = $Label


func _add_to_report(
	test_name: String,
	milliseconds: int,
) -> void:
	label.text += "%s: %s\n" % [
		test_name.rpad(37),
		str(milliseconds),
	]


func _ready() -> void:
	var start: int
	var end: int

	#region Untyped addition

	start = Time.get_ticks_msec()

	var _untyped_a = 0

	for i in range(ITERATIONS):
		_untyped_a += 1

	end = Time.get_ticks_msec()

	_add_to_report(
		"Untyped addition",
		end - start,
	)

	#endregion

	#region Typed addition

	start = Time.get_ticks_msec()

	var _typed_a: int = 0

	for i in range(ITERATIONS):
		_typed_a += 1

	end = Time.get_ticks_msec()

	_add_to_report(
		"Typed addition",
		end - start,
	)

	#endregion

	#region Untyped multiplication

	start = Time.get_ticks_msec()

	var _untyped_b = 0.0

	for i in range(ITERATIONS):
		_untyped_b *= 1.1

	end = Time.get_ticks_msec()

	_add_to_report(
		"Untyped multiplication",
		end - start,
	)

	#endregion

	#region Typed multiplication

	start = Time.get_ticks_msec()

	var _typed_b: float = 0.0

	for i in range(ITERATIONS):
		_typed_b *= 1.1

	end = Time.get_ticks_msec()

	_add_to_report(
		"Typed multiplication",
		end - start,
	)

	#endregion

	#region Untyped vector rotation

	start = Time.get_ticks_msec()

	var _untyped_vector2_a = Vector2.ONE
	var _untyped_vector2_b = Vector2.ONE * 2

	for i in range(ITERATIONS):
		_untyped_vector2_a.distance_squared_to(_untyped_vector2_b)

	end = Time.get_ticks_msec()

	_add_to_report(
		"Untyped Vector2 distance calculation",
		end - start,
	)

	#endregion

	#region Typed vector rotation

	start = Time.get_ticks_msec()

	var _typed_vector2_a: Vector2 = Vector2.ONE
	var _typed_vector2_b: Vector2 = Vector2.ONE * 2

	for i in range(ITERATIONS):
		_typed_vector2_a.distance_squared_to(_typed_vector2_b)

	end = Time.get_ticks_msec()

	_add_to_report(
		"Typed Vector2 distance calculation",
		end - start,
	)

	#endregion
