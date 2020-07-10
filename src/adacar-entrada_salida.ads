package AdaCar.Entrada_Salida is

   function Init_System return Boolean;
   
   function Lectura_Digital(Canal: Canal_DI) return Estado_Digital;
   
   procedure Salida_Digital(Canal: Canal_DO; Valor: Estado_Digital);
   
   procedure Configura_Analogico(Canal: Canal_AI);
   
   function Lectura_Analogico(Canal: Canal_AI) return Unidades_AI;
   
end AdaCar.Entrada_Salida;
