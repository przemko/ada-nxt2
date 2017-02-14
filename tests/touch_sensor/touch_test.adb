with Ada.Real_Time; use Ada.Real_Time;
with NXT; use NXT;
with NXT.AVR; use NXT.AVR;
with NXT.Last_Chance;
with NXT.Touch_Sensors; use NXT.Touch_Sensors;
with NXT.Display; use NXT.Display;

procedure Touch_Test is
   ts: Touch_Sensor(Sensor_1);

begin
   Put_Line("Press Touch_Sensor(1) to Power Down");
   
   delay until Clock + MilliSeconds(50);
   
   loop      
      if Pressed(Ts) then
	 Power_Down;
     end if;

     delay until Clock + Milliseconds(50);
     
   end loop;
end Touch_Test;
