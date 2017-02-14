with Ada.Real_Time; use Ada.Real_Time;
with NXT; use NXT;
with NXT.AVR; use NXT.AVR;
with NXT.Last_Chance;
with NXT.Buttons; use NXT.Buttons;

with Tasks; use Tasks;

procedure Display_Test is
begin
   
   delay until Clock + MilliSeconds(50);
   
   loop      
      if Current_Button = Power_Button then
	 Power_Down;
     end if;

     delay until Clock + Milliseconds(50);
     
   end loop;
end Display_Test;
