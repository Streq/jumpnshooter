extends Node
signal finished()
onready var SENORA: Node = $"Señora"
onready var JEFE: Node = $Jefe
onready var GERARDO: Node = $Gerardo



func trigger():
	
	SENORA.say("MI BEBÉ")
#
#	(VIENE LA SENORA)
#
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

	JEFE.say("Preguntale si alguna vez lo volvió a ver")

	GERARDO.say("Lo volvió a ver al señor?")

	SENORA.say("NO, NUNCA")

	JEFE.say("Bueno, creo que sabemos todo lo que podemos preguntar, ya podés volver a la base.")
	GERARDO.say("Bueno me voy, señora, ya sé que lo de hoy fue horrible, pero fue necesario, y le prometo que vamos a luchar por que nadie nunca vuelva a pasar por lo que usted pasó hoy.")

	SENORA.say("NO ME SIRVE ESO, NUNCA VOY A VOLVER A VER A MI BEBé")
	GERARDO.say("Bue re egoísta")
	SENORA.say("VÁYASE DE MI CASA, POR FAVOR, DÉJEME SOLA")
	GERARDO.say("Está bien, perdón")

#	VOLVIENDO A LA BASE
#
	JEFE.say("La verdad pibe, bastante bien, por un lado tengo mis dudas porque sos medio boludo pero después de ver como recagaste a tiros a ese bebé me quito el sombrero.")

	

#	NARRADOR.say("Y RIERON HASTA EL FIN DE LOS TIEMPOS")



	emit_signal("finished")
