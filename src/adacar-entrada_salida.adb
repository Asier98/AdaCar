with AdaCar.Parametros;

package body AdaCar.Entrada_Salida is


   protected Entrada_Salida_PO
     with Priority => Parametros.Techo_Entrada_Salida_PO
   is
      function Init_System return Boolean;
      function Lectura_Digital(Canal: Canal_DI) return Estado_Digital;
      procedure Salida_Digital(Canal: Canal_DO; Valor: Estado_Digital);
      procedure Configura_Analogico (Canal : Canal_AI);
      function Lectura_Analogico (Canal : Canal_AI) return Unidades_AI;
   end Entrada_Salida_PO;


   -----------------
   -- Init_System --
   -----------------

   function Init_System return Boolean is
   begin
      return Entrada_Salida_PO.Init_System;
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

   procedure Configura_Analogico (Canal : Canal_AI) is
   begin
      Entrada_Salida_PO.Configura_Analogico(Canal);
   end Configura_Analogico;

   -----------------------
   -- Lectura_Analogico --
   -----------------------

   function Lectura_Analogico (Canal : Canal_AI) return Unidades_AI is
   begin
      return Entrada_Salida_PO.Lectura_Analogico(Canal);
   end Lectura_Analogico;




   protected body Entrada_Salida_PO is

      function Init_System return Boolean is
      begin
         null;
         return True;
      end Init_System;

      function Lectura_Digital(Canal: Canal_DI) return Estado_Digital is
      begin
         null;
         return Estado_Digital'(0);
      end Lectura_Digital;

      procedure Salida_Digital(Canal: Canal_DO; Valor: Estado_Digital) is
      begin
         null;
      end Salida_Digital;

      procedure Configura_Analogico (Canal : Canal_AI) is
      begin
         null;
      end Configura_Analogico;

      function Lectura_Analogico (Canal : Canal_AI) return Unidades_AI is
      begin
         null;
         return Unidades_AI'(0);
      end Lectura_Analogico;

   end Entrada_Salida_PO;

end AdaCar.Entrada_Salida;
