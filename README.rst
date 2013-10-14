Acerca de
---------------

**SonidoCanaima.sh**, este script nos permite *Activar*, *Cambiar*, *Desactivar* y *Restablecer* el sonido de Inicio de Canaima GNU Linux, expecificamente la version en desarollo 4.0 - Octubre/2013.

**ImagenCanaima.sh**, este script nos permite *Activar*, *Cambiar*, *Desactivar* y *Restablecer* la imagen de Inicio de Canaima GNU Linux, expecificamente la version en desarollo 4.0 - Octubre/2013.

¿Cómo funciona?
---------------

En Canaima GNU Linux 4.0 el directorio donde se encuentra el archivo del sonido de inicio **desktop-login.oga** es: ``/usr/share/sounds/freedesktop/stereo``, el script lo que hace es renombrar este archivo a desktop-login.oga-RESPALDO, al momento de presionar: *Desactivar*, para *Activar* nuestro sonido de inicio de nuevo, lo que hacemos es renombrar el archivo de sonido desktop-login-RESPALDO.oga a su origen: desktop-login.oga. Siempre verificamos si el archivo esta Activado o Desactivado.

En Canaima GNU Linux 4.0 el directorio donde se encuentra la imagen de inicio **login-background.png** es: ``/usr/share/images/desktop-base``, el script lo que hace es renombrar este archivo a login-background-RESPALDO.png, al momento de presionar: *Desactivar*, para *Activar* nuestro sonido de inicio de nuevo, lo que hacemos es renombrar el archivo de sonido login-background-RESPALDO.png a su origen: login-background.png.

Nota: Siempre verificamos si el archivo esta Activado o Desactivado.

Para hacer el *Cambio* del archivo de sonido e imagen, lo primero que hacemos es verificar que el archivo esta *Activo*, luego hacemos una copia de seguridad de este archivo, renombrando el archivo a: login-background-ORIGINAL.png, copiamos y activamos el nuevo archivo/imagen de inicio.

Para *Restablecer* el archivo de sonido e imagen, lo primero renombramos el archivo a: login-background-ORIGINAL.png, a su formato original: login-background.png para que pueda funcionar.

¿De donde?
---------------

**¿De donde nace este script?**, particularmente fue creado porque hace unos días, al instalar Canaima GNU Linux 4.0 mi novia al verla quedo encantada con el sistema y me ha pedido que se lo instale en su maquina, para enseñarle como hacerlo, deje que ella misma lo instale para comprobar que tan difícil es hacerlo, pudo instalarlo sin ningún problema ella sola, sin embargo, luego del primer inicio del sistema, lo primero que me ha mencionado es: 

*¿Como puedo cambiar ese sonido de inicio o en su defecto cambiarlo por otro?*. Me puse a buscar como hacerlo, sin éxito alguno, pues no encontré una opción para ello, desde entonces me puse a crear el siguiente script y de allí nace. Gracias a **Daisy Vargas**, ``@DaisyVrgs``.

La segunda version de este script por solo capricho mio permite poder modificar la imagen de inicio, la pantalla de login de Canaima. Veamos si proximamente el script saca una nueva version, pero solo sera con sus comentarios, sugerencias, ideas, propuestas o sus colaboraciones.

Versiones
---------------
V0.1 = El script permite activar, desactivar, cambiar y restablecer el sonido de inicio de Canaima GNU Linux 4.0
V0.2 = El script permite activar, desactivar, cambiar y restablecer la imagen de inicio de Canaima GNU Linux 4.0

¿Leer mas?
---------------
Para mayor información, consulte la ``http://blvdc.wordpress.com/?p=160``.
