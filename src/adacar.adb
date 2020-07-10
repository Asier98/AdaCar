pragma Ada_2012;
package body AdaCar is

   ---------
   -- "*" --
   ---------

   function "*"
     (A : Unidades_AI; Distancia : Unidades_Distancia)
      return Unidades_Distancia
   is
      Valor_Distancia: Unidades_Distancia;
   begin
      Valor_Distancia:= Unidades_Distancia(A)*Distancia;
      return Valor_Distancia;
   end "*";

end AdaCar;
