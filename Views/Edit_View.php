<?php
    class editUser{

        var $usuario;

        function __construct($usuario=null){

            $this->usuario = $usuario;
            $this->render();



        }

        function render(){


            include '../Views/Header.php'; 
?>
            
			<form method='POST' action='../Controller/Usuario_Controller.php?action=edit&login=<?=$this->usuario->getLogin()?>' enctype="multipart/form-data">
			
				<label><?= $strings['Email'] ?></label>
				<input type="email" id="emailEdit" name="email" value="<?=$this->usuario->getEmail()?>" maxlength="50" size=50>

				<label><?= $strings['DNI'] ?></label>
				<input type="text" id="dniEdit" name="dni"  value="<?=$this->usuario->getDNI()?>" maxlength="9" size=9>

				<label><?= $strings['Dirección'] ?></label>
				<input type="text" id="direccionEdit" name="direccion"  value="<?=$this->usuario->getDir()?>" maxlength="50"
				 size=50>
				
				<label><?= $strings['Nombre'] ?></label>
				<input type="text" id="nombreEdit" name="nombre"  value="<?=$this->usuario->getNombre()?>" maxlength="30" 
				size="30">
			
				<label><?= $strings['Apellidos'] ?></label>
				<input type="text" id="apellidosEdit" value="<?=$this->usuario->getApellidos()?>" name="apellidos" maxlength="50" size=50>

				<label><?= $strings['Avatar'] ?></label>
				<input type="file" id="avatarEdit" name="avatar" maxlength="50" size=50>
			

				<label><?= $strings['Contraseña'] ?></label>
				<input type="password" id="contraseñaEdit" name="contraseña"  value="<?=$this->usuario->getContraseña()?>" maxlength="30" 
				size="30">

				


			
            <a href="../index.php"><i class="material-icons">cancel_presentation</i></a>
			<button class="submit"><i class="material-icons">check_circle</i></button>
		</form>
		

<?php
            include '../Views/Footer.php';
        }



    }
?>