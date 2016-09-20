package;

import flash.utils.Timer;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.group.FlxGroup;
import flixel.math.FlxRandom;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.math.FlxMath;
import sprites.Balas;
import sprites.Enemigos;
import sprites.Escudos;
import sprites.Personaje;
import flixel.FlxObject;
import sprites.BalasEnemigos;

class PlayState extends FlxState
{
	private var enemigoFila1:FlxTypedGroup<FlxObject>;
	private var enemigoFila2:FlxTypedGroup<FlxObject>;
	private var enemigoFila3:FlxTypedGroup<FlxObject>;
	private var enemigoFila4:FlxTypedGroup<FlxObject>;
	private var balasEnemigos:FlxTypedGroup<FlxObject>;
	private var escuditos:FlxTypedGroup<Escudos>;
	private var personaje:sprites.Personaje;
	public var b:Balas;
	public var randomBalas:Int = 2950;
	public var posescux:Int = 20;

	override public function create():Void
	{
		super.create();
		b = new Balas();
		escuditos = new FlxTypedGroup<Escudos>();//cuando me faltaba esto, el juego se cerraba solo.
		for (i in 0...4)
		{   
			var escu:Escudos = new Escudos(posescux,110);
			posescux += 35;
			escuditos.add(escu);
		}
		enemigoFila1 = new FlxTypedGroup<FlxObject>();
		var pos = 3;
		for (i in 0...8)
		{   
			var enemigos1:sprites.Enemigos = new sprites.Enemigos (pos);
			enemigos1.loadGraphic(AssetPaths.Enemigo01__png, true, 16, 16);
			enemigos1.animation.add("mov", [0, 1], 2, true);
			enemigos1.animation.play("mov");			
			enemigoFila1.add(enemigos1);
			pos += 17;
		}
		enemigoFila2 = new FlxTypedGroup<FlxObject>();
	    pos = 3;
		for (i in 0...8)
		{   
			var enemigos2:sprites.Enemigos  = new sprites.Enemigos (pos);
			enemigos2.loadGraphic(AssetPaths.Enemigo02__png, true, 16, 16);
			enemigos2.animation.add("mov", [0, 1], 2, true);
			enemigos2.animation.play("mov");
			enemigoFila2.add(enemigos2);
		    enemigos2.y = 17;
			pos += 17;
		}
		enemigoFila3 = new FlxTypedGroup<FlxObject>();
		pos= 3;
		for (i in 0...8)
		{   
			var enemigos3:sprites.Enemigos = new sprites.Enemigos (pos);
			enemigos3.loadGraphic(AssetPaths.Enemigo03__png, true, 16, 16);
			enemigos3.animation.add("mov", [0, 1], 2, true);
			enemigos3.animation.play("mov");
			enemigoFila3.add(enemigos3);
			enemigos3.y = 34;
			pos += 17;
		}
		enemigoFila4 = new FlxTypedGroup<FlxObject>();
	    pos = 3;
		for (i in 0...8)
		{   
			var enemigos4:sprites.Enemigos  = new sprites.Enemigos (pos);
			enemigos4.loadGraphic(AssetPaths.Enemigo04__png, true, 16, 16);
			enemigos4.animation.add("mov", [0, 1], 2, true);
			enemigos4.animation.play("mov");
			enemigoFila4.add(enemigos4);
		    enemigos4.y = 51;
			pos += 17;
		}
		personaje = new sprites.Personaje();
		add(personaje);
		add(enemigoFila1);
		add(enemigoFila2);
		add(enemigoFila3);
		add(enemigoFila4);
		balasEnemigos = new FlxTypedGroup<FlxObject>();
		add(balasEnemigos);
		add(escuditos);
		personaje.y = FlxG.height - personaje.height;
		personaje.x = FlxG.width / 2 - personaje.width / 2;
	}
	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		personaje.acciones();
		creaBalasEnemigo();
		colisionBalaJugador();
		colisionBalaEnemigo();
		colisionBalasBalas();
		escudosColision();
		restart();
		Reg.enemigosAlive = contadorEnemigos();
		if (FlxG.keys.justPressed.SPACE && Reg.disparo == true)
		{			
			b = new Balas();
			Reg.disparo = false;
			b.x = personaje.x + personaje.width / 2;
			b.y = personaje.y;
			FlxG.state.add(b);
		}
	}	
	public function creaBalasEnemigo():Void
	{
		for (i	in 0...enemigoFila1.length ) 
		{
			if (FlxG.random.int(1, randomBalas) == 1 && enemigoFila1.members[i].alive) 
			{
				var br:Balasenemigo = new Balasenemigo(enemigoFila1.members[i].x+enemigoFila1.members[i].width/2 - 1.5,enemigoFila1.members[i].y+enemigoFila1.members[i].height/2);
				balasEnemigos.add(br);
			}
		}
		for (i	in 0...enemigoFila2.length ) 
		{			
			if (FlxG.random.int(1, randomBalas) == 1 && enemigoFila2.members[i].alive) 
			{
				var br:Balasenemigo = new Balasenemigo(enemigoFila2.members[i].x+enemigoFila2.members[i].width/2 - 1.5,enemigoFila2.members[i].y+enemigoFila2.members[i].height/2);
				balasEnemigos.add(br);
			}			
		}
		for (i	in 0...enemigoFila3.length ) 
		{
			if (FlxG.random.int(1, randomBalas) == 1 && enemigoFila3.members[i].alive) 
			{
				var br:Balasenemigo = new Balasenemigo(enemigoFila3.members[i].x+enemigoFila3.members[i].width/2 - 1.5,enemigoFila3.members[i].y+enemigoFila3.members[i].height/2);
				balasEnemigos.add(br);
			}			
		}
		for (i	in 0...enemigoFila4.length ) 
		{			
			if (FlxG.random.int(1, randomBalas) == 1 && enemigoFila4.members[i].alive) 
			{
				var br:Balasenemigo = new Balasenemigo(enemigoFila4.members[i].x+enemigoFila4.members[i].width/2 - 1.5,enemigoFila4.members[i].y+enemigoFila4.members[i].height/2);
				balasEnemigos.add(br);
			}			
		}
	}
	public function colisionBalaJugador()
	{
		for (i in 0...enemigoFila1.length)
		{
			if (FlxG.overlap(b, enemigoFila1.members[i]))
			{
				Reg.disparo = true;
				b.destroy();
				enemigoFila1.members[i].kill();
				if (randomBalas > 100)
				{
					randomBalas -= 100;
				}
			}
		} 
	    for (i in 0...enemigoFila2.length)
		{
			if (FlxG.overlap(b, enemigoFila2.members[i]))
			{
				Reg.disparo = true;
				b.destroy();
				enemigoFila2.members[i].kill();
				if (randomBalas > 100)
				{
					randomBalas -= 100;
				}
			}
		} 
		for (i in 0...enemigoFila3.length)
		{
			if (FlxG.overlap(b, enemigoFila3.members[i]))
			{
				Reg.disparo = true;
				b.destroy();
				enemigoFila3.members[i].kill();
				if (randomBalas > 100)
				{
					randomBalas -= 100;
				}
			}
		} 
		for (i in 0...enemigoFila4.length)
		{
			if (FlxG.overlap(b, enemigoFila4.members[i]))
			{
				Reg.disparo = true;
				b.destroy();
				enemigoFila4.members[i].kill();
				if (randomBalas > 100)
				{
					randomBalas -= 100;
				}
			}
		}
	}
	public function colisionBalaEnemigo()
	{
		if (Reg.vidasActuales > 0)
		{
			for (i in 0...balasEnemigos.length)
			{
				if (FlxG.overlap(personaje, balasEnemigos.members[i]))
				{
					balasEnemigos.members[i].destroy();
					Reg.vidasActuales--;
					if (Reg.vidasActuales == 0)
					personaje.destroy();
				}
			}
		}
	}
	public function colisionBalasBalas()
	{
		for (i in 0...balasEnemigos.length)
		{
			if (FlxG.overlap(b, balasEnemigos.members[i]))
			{
				b.destroy();
				balasEnemigos.members[i].destroy();
				Reg.disparo = true;
			}
		}
	}
	public function contadorEnemigos():Int
	{
		var a:Int = 0;
		for (i in 0...enemigoFila1.length)
		{
			if (enemigoFila1.members[i].alive)
				a++;
			if (enemigoFila2.members[i].alive)
				a++;
			if (enemigoFila3.members[i].alive)
				a++;
			if (enemigoFila4.members[i].alive)
				a++;
		}
		return a;
	}
	public function escudosColision()
	{
		for (i in 0...escuditos.length)
		{
			if (FlxG.overlap(escuditos.members[i], b))//con bala personaje
			{
				Reg.disparo = true;
				b.destroy();
				escuditos.members[i].restarVidas();
			}
		}
		for (j in 0...escuditos.length)
		{
			for (i in 0...balasEnemigos.length)
			{
				if (FlxG.overlap(escuditos.members[j], balasEnemigos.members[i]))//con balas enemigos
				{
					balasEnemigos.members[i].destroy();
					escuditos.members[j].restarVidas();
				}
			}
		}
	}
	public function restart()
	{
		if (FlxG.keys.pressed.R) 
		{  
			FlxG.resetState();
			Reg.vidasActuales = 3;
			Reg.disparo = true;
			randomBalas = 2950;
			Reg.currentscore = 0;
		}
	}
}
