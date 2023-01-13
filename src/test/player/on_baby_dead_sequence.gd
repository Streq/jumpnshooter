extends Node
signal finished()
onready var SENORA: Node = $"Señora"
onready var JEFE: Node = $Jefe
onready var GERARDO: Node = $Gerardo
onready var door: Sprite = $"../door"
onready var baby_mama: KinematicBody2D = $"../baby_mama"
onready var player: KinematicBody2D = $"../player"
onready var teleport_sequence: Node2D = $"../teleport_sequence"
onready var player_controller: Node = $"../player/player_controller"
onready var HUD = $"../HUD"
onready var fin: Label = $"../teleport_sequence/CanvasLayer/Control/fin"
#func _ready():
#	yield(get_tree().current_scene,"ready")
#	trigger()

func trigger():
	baby_mama.set_facing_dir(sign(player.global_position.x - baby_mama.global_position.x))
	
	if baby_mama.facing_dir > 0:
		SENORA.side = SENORA.SIDE.LEFT
	else:
		SENORA.side = SENORA.SIDE.RIGHT
	SENORA.show_name = false
	door.open()
	yield(door,"open_finished")
	player_controller.disabled = true
	yield(get_tree().create_timer(0.5),"timeout")
	SENORA.say("MI BEBÉ")
	yield(SENORA,"finished")
	yield(get_tree().create_timer(0.5),"timeout")
#	
	baby_mama.visible = true
	yield(get_tree().create_timer(1.0),"timeout")
	player.set_facing_dir(-baby_mama.facing_dir)
	
#	(VIENE LA SENORA)
#
	SENORA.show_name = true
	SENORA.say(
"""MATASTE A MI BEBÉ
POR QUÉ?
ERA UNA CRIATURA"""
	)
	JEFE.say("Señora, su hijo mató a 36 personas")
	yield(JEFE,"finished")
#	(PAUSA)
	get_tree().paused = true
	yield(get_tree().create_timer(1.0),"timeout")

	JEFE.say("Decíselo vos que a mí no me escucha")

	GERARDO.say("Señora su hijo mató a 36 personas")

	GERARDO.say("y aparte me dijo puto")

	SENORA.say("YA SÉ")
	SENORA.say("YA SÉ *sniff*")
	SENORA.say("PERO ESTABA CAMBIANDO, HABÍA DEJADO DE HACER ESAS COSAS")

	JEFE.say("Decile que entendés el dolor por el que está pasando, pero que necesitamos saber cómo fue que su hijo se volvió un monstruo gigante asesino")
	JEFE.say("O sea no así decíselo con carpa")

	GERARDO.say("Señora, entiendo su dolor, pero necesitamos saber cómo hizo el nene para ponerse así morrocotudo")
	GERARDO.say("Con carpa se lo digo")
	JEFE.say("Vos sos boludo? Sabés lo que significa con carpa?")
	GERARDO.say("Así tipo de onda copado")
	JEFE.say("Flaco no me hables a mí")

	SENORA.say("SÍ, MI HIJO NACIÓ MUY ENFERMO")
	SENORA.say("UN DÍA, CUANDO ESTABA AL BORDE DE LA MUERTE, APARECIÓ UN SEÑOR DE SOMBRERO")
	SENORA.say("Y ME DIJO QUE PODÍA HACER QUE NO VOLVIERA A SUFRIR NUNCA MÁS")
	SENORA.say("NO SÉ QUÉ LE HIZO PERO DE UN DÍA PARA EL OTRO, SE CURÓ, YO NO LO PODÍA CREER.")

	JEFE.say("Pidió algo a cambio?")
	GERARDO.say("no se")
	JEFE.say("Preguntale a ella hermano")

	GERARDO.say("pidió algo a cambio el señor?")
	SENORA.say("SÍ. PERO ME DIJO QUE ERA TAN MINÚSCULO QUE NO ME IBA A DAR CUENTA SI ME FALTABA. ALGO DEL NENE, DIJO QUE ERA LA CAUSA DE SU ENFERMEDAD, Y QUE POR ESO NO LO IBA A EXTRAÑAR.")
	SENORA.say("DESPUÉS CON EL TIEMPO MI HIJO SE FUE PONIENDO CADA VEZ MÁS GRANDOTE Y NOS TUVIMOS QUE MUDAR A ESTA CUEVA PORQUE YA NO PASABA POR LA PUERTA")

	JEFE.say("Preguntale si el señor le dijo su nombre")
	GERARDO.say("Le dijo cómo se llama el señor?")

	SENORA.say("Sí, Nasta, me acuerdo porque sonaba como nafta")
	GERARDO.say("Es verdad")
	JEFE.say("Nasta? es la primera vez que enganchamos a un testigo de otro humano convirtiéndose en demonio. Este podría ser el causante de los últimos demonios, si no de todos.")

	JEFE.say("Preguntale si alguna vez lo volvió a ver, y si sabe de dónde o por qué vino")

	GERARDO.say("Lo volvió a ver al señor? sabe de dónde o por qué vino?")

	SENORA.say("NO, NUNCA, MIRE, YO LA VERDAD DE LA DESESPERACIÓN APENAS ALCANCÉ A PREGUNTARLE EL NOMBRE")

	JEFE.say("Bueno, creo que sabemos todo lo que podemos preguntar, ya podés volver a la base.")
	GERARDO.say("Bueno me voy, señora, ya sé que lo de hoy fue horrible, pero fue necesario, y le prometo que vamos a luchar por que nadie nunca vuelva a pasar por lo que usted pasó hoy.")
#	JEFE.say("No le digas esas boludeces a la señora")
	SENORA.say("NO ME SIRVE ESO, NUNCA VOY A VOLVER A VER A MI BEBÉ")
	GERARDO.say("Bue re egoísta")
	SENORA.say("VÁYASE, POR FAVOR, DÉJEME SOLA")
	GERARDO.say("Sí, perdón")

#	VOLVIENDO A LA BASE
#
	yield(GERARDO,"finished")
	teleport_sequence.trigger()
	yield(teleport_sequence,"finished")
	JEFE.say("La verdad pibe, bastante bien, por un lado tengo mis dudas porque sos medio boludo pero después de ver como mataste a ese bebé me quito el sombrero.")
	JEFE.say("Esto es todo por hoy, Santi tiene una jam así que se va a hacer otro juego, por ahí retome este, por ahí no, lo importante es que la vida sigue y nos vemos la PRÓXIMA")
	yield(JEFE,"finished")
	HUD.visible = false
	fin.visible = true
	
#	NARRADOR.say("Y RIERON HASTA EL FIN DE LOS TIEMPOS")



	emit_signal("finished")
