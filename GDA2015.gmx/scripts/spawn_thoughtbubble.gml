///spawn_thoughtbubble(type)
// type = c_lecture, c_anecdote or c_random

var cx, cy, tb;

switch (argument0) //set which thought bubble
{
    case c_lecture:
        tb = obj_lecturematerial; break
        
    case c_anecdote:
        tb = obj_anecdote; break
        
    case c_random:
    tb = choose(obj_anecdote, obj_lecturematerial); break
}

with (instance_create(0, 0, tb))
{
        isanecdote = (object_index == obj_anecdote) //return 0 for lecture, 1 for anecdote
        dialog = bubble_dialog[isanecdote, random(array_length_2d(bubble_dialog,isanecdote))]
        
        do //randomise spawn position
        {
            x = sprite_width+random(room_width-sprite_width*2);
            y = sprite_height+random(room_height-sprite_height*2);
        }
        until (place_free(x, y));
}