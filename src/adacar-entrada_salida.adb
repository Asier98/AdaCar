with AdaCar.Parametros;

package body AdaCar.Entrada_Salida is

   -----------------------
   -- Entrada_Salida_PO --
   -----------------------

   protected Entrada_Salida_PO
     with Priority => Parametros.Techo_Entrada_Salida_PO
   is
      procedure Init_System;
      function Lectura_Digital(Canal: Canal_DI) return Estado_Digital;
      procedure Salida_Digital(Canal: Canal_DO; Valor: Estado_Digital);
      procedure Comienza_Analogico (Canal : Canal_AI);
      function Lectura_Analogico (Canal : Canal_AI) return Unidades_AI;
   end Entrada_Salida_PO;


   -----------------
   -- Init_System --
   -----------------

   procedure Init_System  is
   begin
      Entrada_Salida_PO.Init_System;
   end Init_System;

   ---------------------
   -- Lectura_Digital --
   ---------------------

   function Lectura_Digital (Canal : Canal_DI) return Estado_Digital is
   begin
      return Entrada_Salida_PO.Lectura_Digital(Canal);
   end Lectura_Digital;

   --------------------
   -- Salida_Digital --
   --------------------

   procedure Salida_Digital (Canal : Canal_DO; Valor : Estado_Digital) is
   begin
      Entrada_Salida_PO.Salida_Digital(Canal,Valor);
   end Salida_Digital;

   -------------------------
   -- Configura_Analogico --
   -------------------------

   procedure Comienza_Analogico (Canal : Canal_AI) is
   begin
      Entrada_Salida_PO.Comienza_Analogico(Canal);
   end Comienza_Analogico;

   -----------------------
   -- Lectura_Analogico --
   -----------------------

   function Lectura_Analogico (Canal : Canal_AI) return Unidades_AI is
   begin
      return Entrada_Salida_PO.Lectura_Analogico(Canal);
   end Lectura_Analogico;



   -----------------------
   -- Entrada_Salida_PO --
   -----------------------

   protected body Entrada_Salida_PO is

      procedure Init_System is
      begin
         Digital.Configure_Pin(Pin_D2,Input);
         Digital.Configure_Pin(Pin_D3,Input);
         Digital.Configure_Pin(Pin_D4,Input);
         Digital.Configure_Pin(Pin_D5,Input);
         Digital.Configure_Pin(Pin_D6,Input);
         Digital.Configure_Pin(Pin_D7,Input);

         Digital.Configure_Pin(Pin_D8,Output);
         Digital.Configure_Pin(Pin_D9,Output);
         Digital.Configure_Pin(Pin_D10,Output);
         Digital.Configure_Pin(Pin_D11,Output);
         Digital.Configure_Pin(Pin_D12,Output);
         Digital.Configure_Pin(Pin_D13,Output);

         Digital.Set_Signal(Pin_D8,LOW);
         Digital.Set_Signal(Pin_D9,LOW);
         Digital.Set_Signal(Pin_D10,LOW);
         Digital.Set_Signal(Pin_D11,LOW);
         Digital.Set_Signal(Pin_D12,LOW);
         Digital.Set_Signal(Pin_D13,LOW);

         Analog.Configure_Pin(Pin_A0);
         Analog.Configure_Pin(Pin_A1);
         Analog.Configure_Pin(Pin_A2);
      end Init_System;

      function Lectura_Digital(Canal: Canal_DI) return Estado_Digital is
         Valor: Signal_Mode;
      begin
         Valor:= Digital.Read_Signal(Canal);
         case Valor is
            when LOW =>
               return Estado_Digital'(0);
            when HIGH =>
               return Estado_Digital'(1);
         end case;
      end Lectura_Digital;

      procedure Salida_Digital(Canal: Canal_DO; Valor: Estado_Digital) is
      begin
         case Valor is
            when 0 =>
               Digital.Set_Signal(Canal,LOW);
            when 1 =>
               Digital.Set_Signal(Canal,HIGH);
         end case;
      end Salida_Digital;

      procedure Comienza_Analogico (Canal : Canal_AI) is
      begin
         Analog.Start_Adquisition(Canal);
      end Comienza_Analogico;

      function Lectura_Analogico (Canal : Canal_AI) return Unidades_AI is
      begin
         return Unidades_AI(Analog.Get_Value(Canal));
      end Lectura_Analogico;

   end Entrada_Salida_PO;

end AdaCar.Entrada_Salida;
