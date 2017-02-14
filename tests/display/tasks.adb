with Ada.Real_Time; use Ada.Real_Time;
with NXT.Display.Concurrent; use NXT.Display.Concurrent;

package body Tasks is
   
   task body A is 
   begin
      for I in 1 .. 64 loop
	 Put("A");
	 delay until Clock + MilliSeconds(1);
      end loop;
   end A;
   
   task body B is 
   begin
      for I in 1 .. 64 loop
	 PUT("B");
	 delay until Clock + MilliSeconds(2);
      end loop;
   end B;
   
end Tasks;
