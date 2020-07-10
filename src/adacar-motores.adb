with AdaCar.Parametros;

package body AdaCar.Motores is


   protected Motores_PO
     with Priority => Parametros.Techo_Motores_PO
   is
      procedure Actua_Step (Motor : Tipo_Motor; Valor: Tipo_Step);
      procedure Actua_Direccion (Motor : Tipo_Motor; Valor : Tipo_Direccion);
   private

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



   protected body Motores_PO is

      procedure Actua_Step (Motor : Tipo_Motor; Valor: Tipo_Step) is
      begin
         null;
      end Actua_Step;

      procedure Actua_Direccion (Motor : Tipo_Motor; Valor : Tipo_Direccion) is
      begin
         null;
      end Actua_Direccion;

   end Motores_PO;

end AdaCar.Motores;
