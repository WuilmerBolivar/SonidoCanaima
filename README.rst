Acerca de
---------------

**SonidoCanaima.sh**, este script nos permite *Activar*, *Cambiar* y *Desactivar* el sonido de Inicio de Canaima GNU Linux, expecificamente la version en desarollo 4.0 - Octubre/2013.

¿Cómo funciona?
---------------

En Canaima GNU Linux 4.0 el directorio donde se encuentra el archivo del sonido de inicio **desktop-login.oga** es: ``/usr/share/sounds/freedesktop/stereo``, el script lo que hace es renombrar este archivo a desktop-login.oga-RESPALDO, al momento de presionar: *Desactivar*, para *Activar* nuestro sonido de inicio de nuevo, lo que hacemos es renombrar el archivo de sonido desktop-login-RESPALDO.oga a su origen: desktop-login.oga. Siempre verificamos si el archivo esta Activado o Desactivado.

Para hacer el *Cambio* del archivo de sonido, lo primero que hacemos es verificar que el archivo esta *Activo*, luego hacemos una copia de seguridad de este archivo, copiamos y activamos el archivo de sonido que el usuario a seleccionado.

¿De donde?
---------------

**¿De donde nace este script?**, particularmente fue creado porque hace unos días, al instalar Canaima GNU Linux 4.0 mi novia al verla quedo encantada con el sistema y me ha pedido que se lo instale en su maquina, para enseñarle como hacerlo, deje que ella misma lo instale para comprobar que tan difícil es hacerlo, pudo instalarlo sin ningún problema ella sola, sin embargo, luego del primer inicio del sistema, lo primero que me ha mencionado es: 

*¿Como puedo cambiar ese sonido de inicio o en su defecto cambiarlo por otro?*. Me puse a buscar como hacerlo, sin éxito alguno, pues no encontré una opción para ello, desde entonces me puse a crear el siguiente script y de allí nace. Gracias a **Daisy Vargas**, ``@DaisyVrgs``.

¿Leer mas?
---------------
Para mayor información, consulte la ``http://blvdc.wordpress.com/?p=160``.
