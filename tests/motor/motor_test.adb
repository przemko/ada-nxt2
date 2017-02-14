with Ada.Real_Time; use Ada.Real_Time;
with NXT; use NXT;
with NXT.AVR; use NXT.AVR;
with NXT.Last_Chance;
with NXT.Touch_Sensors; use NXT.Touch_Sensors;
with NXT.Display; use NXT.Display;
with NXT.Buttons; use NXT.Buttons;

procedure Motor_Test is
   Ts: Touch_Sensor(Sensor_1);
begin
     Put_Line("Press Power_Button to power down");
     Put_Line("Press Touch_Sensor(Sensor_1) to start Motor_A for 1 second");
   
   delay until Clock + MilliSeconds(50);
   
   loop
      if Current_Button = Power_Button then
	 Power_Down;
      end if;
      
      if Pressed(Ts) then
	 Set_Power(Motor_A, 100, True);
	 delay until Clock + Seconds(1);
	 Set_Power(Motor_A, 0, True);
     end if;

     delay until Clock + Milliseconds(50);
     
   end loop;
end Motor_Test;

