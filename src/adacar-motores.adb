with AdaCar.Parametros;
use AdaCar.Parametros;
with AdaCar.Entrada_Salida;

package body AdaCar.Motores is

   type Canal_Encendido is mod 4;
   -- 0 => Canal_A
   -- 1 => Canal_B
   -- 2 => Canal_C
   -- 3 => Canal_D


   ----------------
   -- Motores_PO --
   ----------------

   protected Motores_PO
     with Priority => Parametros.Techo_Motores_PO
   is
      procedure Actua_Direccion (Motor : Tipo_Motor; Valor : Tipo_Direccion);
      procedure Actua_Step (Motor : Tipo_Motor; Valor: Tipo_Step);
   private
      Direccion_Motor_Derecha: Tipo_Direccion;
      Direccion_Motor_Izquierda: Tipo_Direccion;
      Ultimo_Canal_Encendido_Derecha: Canal_Encendido;
      Ultimo_Canal_Encendido_Izquierda: Canal_Encendido;
   end Motores_PO;



   ----------------
   -- Actua_Step --
   ----------------

   procedure Actua_Step (Motor : Tipo_Motor; Valor: Tipo_Step) is
   begin
      Motores_PO.Actua_Step(Motor,Valor);
   end Actua_Step;

   ---------------------
   -- Actua_Direccion --
   ---------------------

   procedure Actua_Direccion (Motor : Tipo_Motor; Valor : Tipo_Direccion) is
   begin
      Motores_PO.Actua_Direccion(Motor,Valor);
   end Actua_Direccion;


   ----------------
   -- Motores_PO --
   ----------------

   protected body Motores_PO is

      procedure Actua_Direccion (Motor : Tipo_Motor; Valor : Tipo_Direccion) is
      begin
         case Motor is
            when Motor_Derecho =>
               Direccion_Motor_Derecha:= Valor;
            when Motor_Izquierdo =>
               Direccion_Motor_Izquierda:= Valor;
            when Ambos_Motores =>
               Direccion_Motor_Izquierda:= Valor;
               Direccion_Motor_Derecha:= Valor;
         end case;
      end Actua_Direccion;


      procedure Actua_Step (Motor : Tipo_Motor; Valor: Tipo_Step) is
      begin
         case Motor is
            when Motor_Derecho =>
               case Direccion_Motor_Derecha is
               when Hacia_Delante =>
                  case Ultimo_Canal_Encendido_Derecha is
                     when 0 =>
                        Entrada_Salida.Salida_Digital(Canal_DO_Motor_Derecho_B,Estado_Digital'(1));
                        Entrada_Salida.Salida_Digital(Canal_DO_Motor_Derecho_A,Estado_Digital'(0));
                     when 1 =>
                        Entrada_Salida.Salida_Digital(Canal_DO_Motor_Derecho_C,Estado_Digital'(1));
                        Entrada_Salida.Salida_Digital(Canal_DO_Motor_Derecho_B,Estado_Digital'(0));
                     when 2 =>
                        Entrada_Salida.Salida_Digital(Canal_DO_Motor_Derecho_D,Estado_Digital'(1));
                        Entrada_Salida.Salida_Digital(Canal_DO_Motor_Derecho_C,Estado_Digital'(0));
                     when 3 =>
                        Entrada_Salida.Salida_Digital(Canal_DO_Motor_Derecho_A,Estado_Digital'(1));
                        Entrada_Salida.Salida_Digital(Canal_DO_Motor_Derecho_D,Estado_Digital'(0));
                  end case;
                  Ultimo_Canal_Encendido_Derecha:= Ultimo_Canal_Encendido_Derecha+1;

               when Hacia_Detras =>
                  case Ultimo_Canal_Encendido_Derecha is
                     when 0 =>
                        Entrada_Salida.Salida_Digital(Canal_DO_Motor_Derecho_D,Estado_Digital'(1));
                        Entrada_Salida.Salida_Digital(Canal_DO_Motor_Derecho_A,Estado_Digital'(0));
                     when 1 =>
                        Entrada_Salida.Salida_Digital(Canal_DO_Motor_Derecho_A,Estado_Digital'(1));
                        Entrada_Salida.Salida_Digital(Canal_DO_Motor_Derecho_B,Estado_Digital'(0));
                     when 2 =>
                        Entrada_Salida.Salida_Digital(Canal_DO_Motor_Derecho_B,Estado_Digital'(1));
                        Entrada_Salida.Salida_Digital(Canal_DO_Motor_Derecho_C,Estado_Digital'(0));
                     when 3 =>
                        Entrada_Salida.Salida_Digital(Canal_DO_Motor_Derecho_C,Estado_Digital'(1));
                        Entrada_Salida.Salida_Digital(Canal_DO_Motor_Derecho_D,Estado_Digital'(0));
                  end case;
                  Ultimo_Canal_Encendido_Derecha:= Ultimo_Canal_Encendido_Derecha-1;
               end case;

            when Motor_Izquierdo =>
               case Direccion_Motor_Izquierda is
               when Hacia_Delante =>
                  case Ultimo_Canal_Encendido_Izquierda is
                     when 0 =>
                        Entrada_Salida.Salida_Digital(Canal_DO_Motor_Izquierdo_B,Estado_Digital'(1));
                        Entrada_Salida.Salida_Digital(Canal_DO_Motor_Izquierdo_A,Estado_Digital'(0));
                     when 1 =>
                        Entrada_Salida.Salida_Digital(Canal_DO_Motor_Izquierdo_C,Estado_Digital'(1));
                        Entrada_Salida.Salida_Digital(Canal_DO_Motor_Izquierdo_B,Estado_Digital'(0));
                     when 2 =>
                        Entrada_Salida.Salida_Digital(Canal_DO_Motor_Izquierdo_D,Estado_Digital'(1));
                        Entrada_Salida.Salida_Digital(Canal_DO_Motor_Izquierdo_C,Estado_Digital'(0));
                     when 3 =>
                        Entrada_Salida.Salida_Digital(Canal_DO_Motor_Izquierdo_A,Estado_Digital'(1));
                        Entrada_Salida.Salida_Digital(Canal_DO_Motor_Izquierdo_D,Estado_Digital'(0));
                  end case;
                  Ultimo_Canal_Encendido_Izquierda:= Ultimo_Canal_Encendido_Izquierda+1;

               when Hacia_Detras =>
                  case Ultimo_Canal_Encendido_Izquierda is
                     when 0 =>
                        Entrada_Salida.Salida_Digital(Canal_DO_Motor_Izquierdo_D,Estado_Digital'(1));
                        Entrada_Salida.Salida_Digital(Canal_DO_Motor_Izquierdo_A,Estado_Digital'(0));
                     when 1 =>
                        Entrada_Salida.Salida_Digital(Canal_DO_Motor_Izquierdo_A,Estado_Digital'(1));
                        Entrada_Salida.Salida_Digital(Canal_DO_Motor_Izquierdo_B,Estado_Digital'(0));
                     when 2 =>
                        Entrada_Salida.Salida_Digital(Canal_DO_Motor_Izquierdo_B,Estado_Digital'(1));
                        Entrada_Salida.Salida_Digital(Canal_DO_Motor_Izquierdo_C,Estado_Digital'(0));
                     when 3 =>
                        Entrada_Salida.Salida_Digital(Canal_DO_Motor_Izquierdo_C,Estado_Digital'(1));
                        Entrada_Salida.Salida_Digital(Canal_DO_Motor_Izquierdo_D,Estado_Digital'(0));
                  end case;
                  Ultimo_Canal_Encendido_Izquierda:= Ultimo_Canal_Encendido_Izquierda-1;

               end case;

            when Ambos_Motores =>
               null;
         end case;

      end Actua_Step;


   end Motores_PO;

end AdaCar.Motores;
