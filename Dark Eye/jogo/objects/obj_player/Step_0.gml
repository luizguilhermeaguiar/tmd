#region controles
key_right = keyboard_check(ord("D")) //DIREITA
key_left = keyboard_check(ord("A")) //ESQUERDA
key_jump = keyboard_check(vk_space) // PULA
key_shoot = mouse_check_button(mb_left) // TIRO
#endregion

#region movimentação
var move = key_right - key_left

hspd = move * spd;

vspd = vspd + grv;

if (hspd != 0) image_xscale = sign(hspd)

//Colisão horizontal
if place_meeting(x+hspd, y, obj_wall)
{
	while(!place_meeting(x+sign(hspd), y, obj_wall))
	{
		x = x + sign(hspd);
	}
	hspd = 0;
}
x = x + hspd;

//Colisão Vertical
if place_meeting(x, y+vspd, obj_wall)
{
	while(!place_meeting(x, y+sign(vspd), obj_wall))
	{
		y = y + sign(vspd);
	}
	vspd = 0;
}
y = y + vspd;

//JUMP
if place_meeting(x, y+1, obj_wall) and key_jump
{
vspd -= 12
	
}
#endregion

#region tiro
var flipped = direction;
var gun_x = (x+4)*(flipped)
var _xx = x + lengthdir_x(15,image_angle)
var y_offset = x + lengthdir_y(-20,image_angle)

if key_shoot and global.bullets > 0
{
	with (instance_create_layer(_xx, y+10, "Shoot", obj_shot))
	{
		global.bullets--;
		speed = 20; //VELOCIDADE DO TIRO
		direction = -180 + 90 * other.image_xscale; // DIREÇÃO
		image_angle = direction; //ANGULO
	}
}


#endregion