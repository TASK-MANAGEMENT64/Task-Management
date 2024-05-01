#Feature 1-------------------------------------------------------------------------------------------------------------------------

Feature: RI01: Registro de Usuarios Nuevos
    Como usuario nuevo  
    Quiero poder registrarme en la aplicación 
    Para acceder a sus funcionalidades

Scenario: Registro Exitoso
    Dado que el usuario es nuevo
    Cuando el usuario ingresa sus <datos de registro> 
        (<nombre>, <direccion de correo electronico>, <contrasenna>)
    Entonces se crea una cuenta nueva con los <datos de registro> proporcionados
    Y se muestra un <mensaje de confirmacion> de registro exitoso
    Y se redirige al usuario a la pantalla de inicio de sesión

Examples: Datos de entrada
    | nombre | direccion de correo electronico | contrasenna |
    | Juan | juan123@gmail.com | juan123 |

Examples: Datos de salida
    | mensaje de confirmacion |
    | Bienvenido a Workline |

Scenario: Registro con correo electrónico ya registrado
    Dado que el usuario es nuevo
    Cuando el usuario ingresa sus <datos de registro> (<nombre>, <direccion de correo electronico>, <contrasenna>)
    Y la <direccion de correo electronico> ingresada ya está registrada en el sistema
    Entonces se muestra un <mensaje de error>, indicando que el correo electrónico ya está registrado

Examples: Datos de entrada
    | nombre | direccion de correo electronico | contrasenna |
    | Maria | maria123@gmail.com | maria123 |

Examples: Datos de salida
    | mensaje de error |
    | La dirección de correo electrónico ya fue registrada |

Scenario: Registro con datos incompletos
    Dado que el usuario es nuevo
    Cuando el usuario intente registrar una cuenta sin proporcionar todos los <datos requeridos> 
    (<nombre>, <direccion de correo electronico>, <contrasenna>)
    Entonces se muestra un <mensaje de error>, indicando que todos los campos deben ser completados

Examples: Datos de entrada
    | nombre | direccion de correo electronico | contrasenna |
    | Jose | jose123@gmail.com | (NULL) |

Examples: Datos de salida
    | mensaje de error |
    | Es necesario proporcionar una contraseña para la cuenta |

#Feature 2-------------------------------------------------------------------------------------------------------------------------

Feature: Acceso de usuarios ya registrados
    Como usuario existente
    Quiero tener la capacidad de llevar a cabo el proceso de inicio de sesión en la aplicación 
        utilizando mi dirección de correo electrónico y contraseña 
    Para acceder a mi cuenta

Scenario: Inicio de sesión exitoso

    Dado que el usuario tiene una cuenta existente
    Cuando el usuario ingresa su <direccion de correo electronico> y <contrasenna> correctos
    Entonces se redirige al usuario a la página principal de la aplicación

Examples: Datos de entrada
    | direccion de correo electronico | contrasenna |
    | ana123@gmail.com | ana123 |

Examples: Datos de salida
    | Ninguno |

Scenario: Inicio de sesión con correo electrónico o contraseña incorrecta
    Dado que el usuario tiene una cuenta existente
    Cuando el usuario ingresa su <direccion de correo electronico> y <contrasenna> incorrectos
    Entonces se muestra un <mensaje de error>, indicando que los datos ingresados son incorrectos

Examples: Datos de entrada
    | direccion de correo electronico | contrasenna |
    | pedro123@gmail.com | pedro123 |

Examples: Datos de salida
    | mensaje de error |
    | Dirección de correo electrónico o contraseña incorrecto |

Scenario: Inicio de sesión con cuenta no activada
    Dado que el usuario tiene una cuenta existente
    Cuando el usuario intenta iniciar sesión con una <cuenta> que no ha sido activada
    Entonces se muestra un <mensaje de error>, indicando que la cuenta no está activada

Examples: Datos de entrada
    | cuenta |
    | pam123@gmail.com, pam123 |

Examples: Datos de salida
    | mensaje de error |
    | La cuenta aún no ha sido activada |

#Feature 3-------------------------------------------------------------------------------------------------------------------------

Feature: Recuperación de Contraseña

    Como usuario 
    Quiero tener la capacidad de restablecer mi contraseña en caso de olvidarla
    Para así poder acceder nuevamente a mi cuenta.

Scenario: El usuario desconoce su contraseña
    Dado que el usuario ha olvidado su contraseña
    Cuando el usuario selecciona la opción de <Olvide mi contrasenna> en la pantalla de inicio de sesión
    Entonces se le solicita al usuario que ingrese la <direccion de correo electronico> asociada a su cuenta

Examples: Datos de entrada
    | Olvide mi contrasenna | direccion de correo electronico |
    | Olvidé mi contraseña | pedro123@gmail.com |

Examples: Datos de salida
    | Ninguno |

Scenario: El usuario proporciona un correo correcto
    Dado que el usuario ha seleccionado la opción <Olvide mi contrasenna>
    Cuando el usuario proporciona la <direccion de correo electronico> válida
    Entonces se envía un <correo electronico> con un enlace de restablecimiento de contraseña al 
    correo electrónico proporcionado

Examples: Datos de entrada
    | Olvide mi contrasenna | direccion de correo electronico |
    | Olvidé mi contraseña | mariana123@gmail.com |

Examples: Datos de salida
    | correo electronico |
    | restablece tu contraseña aquí |

Scenario: El usuario proporciona un correo incorrecto
    Dado que el usuario ha seleccionado la opción <Olvide mi contrasenna>
    Cuando el usuario proporcione una <direccion de correo electronico> inválida
    Entonces se muestra un <mensaje de error>, indicando que la dirección de correo electrónico no 
    está registrada en el sistema

Examples: Datos de entrada
    | Olvide mi contrasenna | direccion de correo electronico |
    | Olvidé mi contraseña | pepe123@gmial.com |

Examples: Datos de salida
    | mensaje de error|
    | Correo electrónico no válido |

Scenario: El usuario habilita el restablecimiento de contraseña
    Dado que el usuario se encuentra en el correo enviado al correo electrónico proporcionado
    Cuando el usuario haga clic en el enlace de restablecimiento de contraseña
    Entonces se le redirige a una página donde puede ingresar una nueva contraseña

Examples: Datos de entrada
    | Ninguno |

Examples: Datos de salida
    | Ninguno |

Scenario: El usuario restablece su contraseña
    Dado que el usuario se encuentra en la página de restablecimiento de contraseña
    Cuando el usuario ingresa y confirma la nueva <contrasenna>
    Entonces se muestra un <mensaje de confirmacion>, indicando que la contraseña se ha restablecido correctamente
    Y se le redirige a la pantalla de inicio de sesión

Examples: Datos de entrada
    | contrasenna |
    | kevin123 |

Examples: Datos de salida
    | mensaje de confirmacion |
    | Contraseña recuperada satisfactoriamente |

#Feature 4-------------------------------------------------------------------------------------------------------------------------

Feature: Generación de Nuevos Proyectos
    Como usuario
    Quiero tener la capacidad de crear nuevos proyectos en la aplicación 
    Para ordenar y administrar mi labor

Scenario: Acceder a la página de creación de proyectos
    Dado que el usuario se encuentra en la página principal
    Cuando el usuario presiona el botón <Crear Proyecto>
    Entonces se le redirige a la página de creación de proyectos

Examples: Datos de entrada
    | Crear Proyecto |
    | Crear Proyecto Nuevo |

Examples: Datos de salida
    | Ninguno |

Scenario: Creación de proyecto exitosa
    Dado que el usuario se encuentra en la página de creación de proyectos
    Cuando el usuario ingresa los <detalles del proyecto> 
    (<nombre>, <descripcion>, <fecha de inicio>, <fecha de finalizacion>)
    Y hace clic en el botón de <Crear Proyecto>
    Entonces se crea un nuevo proyecto con los detalles proporcionados
    Y se muestra un <mensaje de confirmacion> de que el proyecto se ha creado correctamente

Examples: Datos de entrada
    | nombre | descripcion | fecha de inicio | fecha de finalizacion |
    | Proyecto Principal | Este es el proyecto principal | 01/01/2023 | 31/12/2023 |

Examples: Datos de salida
    | mensaje de confirmacion |
    | Proyecto creado satisfactoriamente |

Scenario: Creación de proyecto con datos incompletos
    Dado que el usuario se encuentra en la página de creación de proyectos
    Cuando el usuario intenta crear un proyecto sin proporcionar 
    todos los <datos requeridos>
    Entonces se muestra un <mensaje de error>, indicando que todos los 
    campos obligatorios deben ser completados

Examples: Datos de entrada
    | nombre | descripcion | fecha de inicio | fecha de finalizacion |
    | Proyecto Final | Este es el proyecto final |  | 31/12/2023 |

Examples: Datos de salida
    | mensaje de error |
    | No se pudo crear el proyecto. Falta la fecha de inicio |

Scenario: Creación de proyecto con proyecto duplicado
    Dado que el usuario se encuentra en la página de creación de proyectos
    Cuando el usuario intenta crear un proyecto con un <nombre> que ya existe en la aplicación
    Entonces se muestra un <mensaje de error>, indicando que ya existe un proyecto con ese nombre

Examples: Datos de entrada
    | nombre | descripcion | fecha de inicio | fecha de finalizacion |
    | Proyecto Principal | Este es el proyecto principal | 01/01/2023 | 31/12/2023 |

Examples: Datos de salida
    | mensaje de error |
    | Ya existe otro Proyecto con el mismo nombre. Ingrese un nombre diferente |

#Feature 5-------------------------------------------------------------------------------------------------------------------------

Feature: Designación de Miembros a Proyectos
   Como jefe de equipo
   Quiero poder asignar miembros a proyectos existentes 
   Para colaborar y asignar tareas específicas

Scenario: Acceder a los detalles del proyecto
    Dado que el usuario se encuentra en la página de gestión de proyectos 
    Cuando el usuario seleccione un <proyecto existente>
    Entonces se redireccionará al usuario a la página de detalles del proyecto

Examples: Datos de entrada
    | proyecto existente |
    | Proyecto Principal, Este es el proyecto principal, 01/01/2023, 31/12/2023 |

Examples: Datos de salida
    | Ninguno |

Scenario: Verificar miembros disponibles para asignar al proyecto
    Dado que el usuario se encuentra en la página de detalles de un <proyecto existente>
    Cuando el usuario selecciona el botón <Asignar miembros>
    Entonces se muestra una <lista de usuarios disponibles> para asignar al proyecto

Examples: Datos de entrada
    | Asignar miembros |
    | Asignar Miembros al Proyecto |

Examples: Datos de salida
    | lista de usuarios disponibles |
    | Maria, Juan, Pedro, Pamela, Luis |

Scenario: Asignación de miembros exitosa
    Dado que el usuario ha seleccionado el botón <Asignar miembros>
    Cuando el usuario selecciona uno o más <usuarios>
    Y presiona el botón <Agregar>
    Entonces los miembros seleccionados se asignan correctamente al proyecto
    Y se muestra un <mensaje de confirmacion> de que la asignación se ha realizado con éxito

Examples: Datos de entrada
    | Asignar miembros | usuarios | Agregar |
    | Asignar Miembros al Proyecto  | Ernesto  | Agregar miembro |

Examples: Datos de salida
    | mensaje de con confirmacion |
    | Miembro(s) agregado(s) correctamente al proyecto |

Scenario: Asignación de miembros de otros proyectos
    Dado que el usuario ha seleccionado el botón <Asignar miembros>
    Cuando el usuario intenta asignar a uno o más <usuarios> a 
    un proyecto existente que están asignados a otros proyectos
    Y presiona el botón <Agregar>
    Entonces se muestra un <mensaje de error>, indicando que uno o más usuarios seleccionados 
    no pueden ser agregados al proyecto por estar dentro de otro actualmente

Examples: Datos de entrada
    | Asignar miembros | usuario | Agregar |
    | Asignar miembros al proyecto  | Ricardo  | Agregar miembro |

Examples: Datos de salida
    | mensaje de error |
    | El usuario ya está involucrado en otro proyecto |

#Feature 6-------------------------------------------------------------------------------------------------------------------------

Feature: Seguimiento del progreso del proyecto
    Como usuario 
    Quiero poder realizar un seguimiento del progreso de los proyectos 
        en los que estoy involucrado 
    Para tener una visión clara del estado y avance de cada proyecto

Scenario: Visualización del progreso del proyecto
    Dado que el usuario se encuentra en la página de detalles de un proyecto existente
    Cuando el usuario presiona el botón <Progreso>
    Entonces se muestra la información sobre las <tareas completadas>, las <tareas pendientes>, 
    el <porcentaje de avance general> y un <grafico> o <indicador visual> que representa el <estado actual del proyecto>

Examples: Datos de entrada
    | Progreso |
    | Progreso del Proyecto  | Ricardo  | Agregar miembro |

Examples: Datos de salida
    | tareas completadas | tareas pendientes | porcentaje de avance general |
    | Ordenar Cuadernos, Registrar libros | Revisar Graficos, Arreglar el estante |  10% | 

Scenario: Actualización del progreso del proyecto
    Dado que el usuario se encuentra en la página de detalles de un proyecto existente
    Cuando el usuario realiza cambios en el <estado de las tareas del proyecto> 
    (marcar una <tarea> como completada, actualizar el <porcentaje de avance>)
    Entonces el <progreso del proyecto> se actualiza automáticamente
    Y se reflejan los cambios en el <grafico> o <indicador visual> de progreso

Examples: Datos de entrada
    | tarea | porcentaje de avance |
    | Lavar la cortina | 0% |

Examples: Datos de salida
    | progreso del proyecto |
    | 10% | 

Scenario: Notificaciones de progreso del proyecto
    Dado que el usuario está involucrado en un proyecto
    Cuando otro usuario involucrado en el proyecto realice cambios significativos en el progreso 
    del proyecto (finalización de una <tarea critica>, cambio en el <porcentaje de avance>)
    Entonces al usuario se le envía una <notificacion> para informarle sobre los cambios realizados

Examples: Datos de entrada
    | tarea | porcentaje de avance |
    | Cocinar | 40% |

Examples: Datos de salida
    | notificacion |
    | El usuario Pedro Picapiedra ha realizado cambios en "Proyecto 1"| 

#Feature 7-------------------------------------------------------------------------------------------------------------------------

Feature: Creación de nuevas tareas
    Como jefe de equipo 
    Quiero poder crear nuevas tareas en los proyectos 
    Para organizar y asignar trabajo específico

Scenario: Entrada al entorno “Crear tarea”
    Dado que el jefe de equipo se encuentra en la página de un proyecto
    Cuando el jefe de equipo seleccione la opción de <Crear tarea> dentro del proyecto
    Entonces el sistema debe redirigirlo al entorno <Crear Tarea>

Examples: Datos de entrada
    | Crear Tarea |
    | Crear Tarea |

Examples: Datos de salida
    | Ninguno |

Scenario: Creación de tarea exitosa
    Dado que el jefe de equipo se encuentra en el entorno <Crear Tarea>
    Cuando el jefe de equipo complete todos los detalles de la <tarea> (<nombre>, <descripcion>, <fecha limite>)
    Y hace clic en el botón de <Crear tarea>
    Entonces se crea una nueva <tarea> con los detalles proporcionados
    Y se muestra un <mensaje de confirmacion>, indicando que la tarea se ha creado correctamente

Examples: Datos de entrada
    | Crear Tarea | nombre | descripcion | fecha limite |
    | Crear Tarea | Tarea 1 | Esta es la tarea 1 | 31/12/2023 |

Examples: Datos de salida
    | mensaje de confirmacion |
    | La tarea se ha creado correctamente |

Scenario: Creación de tarea con datos incompletos
    Dado que el jefe de equipo se ubica en el entorno <Crear Tarea>
    Cuando el jefe de equipo intente crear una <tarea> sin proporcionar 
    todos los detalles de la tarea (<nombre>, <descripcion>, <fecha limite>)
    Entonces se muestra un <mensaje de error>, indicando que todos los campos obligatorios deben ser completados

Examples: Datos de entrada
    | Crear Tarea | nombre | descripcion | fecha limite |
    | Crear Tarea | | Esta es la tarea 1 | 31/12/2023 |

Examples: Datos de salida
    | mensaje de error |
    | Error al crear la tarea. Falta el nombre de la tarea |

Scenario: Creación de tarea con nombre duplicado
    Dado que el jefe de equipo se ubica en el entorno <Crear Tarea>
    Cuando el jefe de equipo intente crear una tarea con un <nombre> que ya existe en el proyecto
    Entonces se muestra un <mensaje de error>, indicando que ya existe una tarea con ese nombre

Examples: Datos de entrada
    | Crear Tarea | nombre |
    | Crear Tarea | Tarea 1 |

Examples: Datos de salida
    | mensaje de error |
    | Ya existe otra tarea con el mismo nombre |

#Feature 8-------------------------------------------------------------------------------------------------------------------------

Feature: Asignación de responsables a tareas

    Como jefe de equipo 
    Quiero poder asignar responsables a las tareas 
    Para definir quién es el encargado de completar cada tarea

Scenario: Entrada al entorno “Detalles de tarea”
    Dado que el jefe de equipo está en la página de un proyecto
    Cuando el jefe de equipo seleccione la opción de <Editar> dentro del proyecto
    Entonces el sistema debe redirigir al jefe de equipo al entorno <Detalles de tarea>

Examples: Datos de entrada
    | Editar |
    | Editar Proyecto |

Examples: Datos de salida
    | Ninguno |

Scenario: Entrada al entorno “Asignar responsable”
    Dado que el jefe de equipo se encuentra en el entorno <Detalles de tarea>
    Cuando el jefe de equipo seleccione la opción de <Asignar responsable>
    Entonces el sistema lo redirige al entorno <Detalles>

Examples: Datos de entrada
    | Asignar responsable |
    | Asignar Responsable |

Examples: Datos de salida
    | Ninguno |

Scenario: Asignación de responsable exitosa
    Dado que el jefe de equipo se encuentra en el entorno <Detalles de tarea>
    Cuando el jefe de equipo seleccione un <usuario> como responsable de la tarea
    Entonces se asigna correctamente el responsable a la <tarea>
    Y se muestra un <mensaje de confirmacion> de que la asignación se ha realizado con éxito

Examples: Datos de entrada
    | usuario |
    | Mario Altamirano |

Examples: Datos de salida
    | mensaje de confirmacion |
    | Se ha asignado a Mario Altamirano como el responsable de la tarea |

Scenario: Asignación de responsable que está asignado a otra tarea
    Dado que el jefe de equipo se encuentra en el entorno <Detalles de tarea>
    Cuando el jefe de equipo intente asignar un responsable que está asignado a otra tarea
    Entonces se muestra un <mensaje de error>, indicando que el usuario seleccionado no está disponible para la asignación

Examples: Datos de entrada
    | usuario |
    | Mario Altamirano |

Examples: Datos de salida
    | mensaje de confirmacion |
    | Se ha asignado a Mario Altamirano como el responsable de la tarea |

Scenario: Asignación de ningún responsable
    Dado que el jefe de equipo se ubica en el entorno <Detalles de tarea>
    Cuando el jefe de equipo no seleccione ningún <usuario> como responsable a la tarea
    Entonces se muestra un <mensaje de error>, indicando que se debe seleccionar un responsable para la tarea

Examples: Datos de entrada
    | usuario |
    |  |

Examples: Datos de salida
    | mensaje de error |
    | No se ha seleccionado a ningún usuario |

#Feature 9-------------------------------------------------------------------------------------------------------------------------

Feature: Actualización del estado de las tareas

    Como usuario 
    Quiero poder actualizar el estado de las tareas 
    Para reflejar su progreso y completitud.

Scenario: Actualización del estado de tarea exitosa
    Dado que el usuario se encuentra en el entorno <Detalles de tarea> de una <tarea> asignada al <usuario>
    Cuando el usuario cambia el <estado de la tarea> a "En progreso" o "Completada"
    Entonces se actualiza correctamente el <estado de la tarea>
    Y se muestra un <mensaje de confirmacion>, indicando que el estado se ha actualizado exitosamente

Examples: Datos de entrada
    | estado de la tarea |
    | En progreso |

Examples: Datos de salida
    | mensaje de confirmacion |
    | El estado de la tarea se ha actualizado correctamente |

Scenario: Actualización del estado de tarea sin permisos
    Dado que el usuario se encuentra en el entorno <Detalles de tarea> de una <tarea> asignada a otra <usuario>
    Cuando el usuario intente cambiar el <estado de la tarea>
    Entonces se muestra un <mensaje de error>, indicando que el usuario no tiene permiso actualizar

Examples: Datos de entrada
    | estado de la tarea |
    | En progreso |

Examples: Datos de salida
    | mensaje de error |
    | No tiene permisos para actualizar el estado de la tarea |

#Feature 10------------------------------------------------------------------------------------------------------------------------

Feature: Comentarios en tareas y proyectos 
    Como usuario
    Quiero poder agregar comentarios a las tareas y proyectos 
    Para facilitar la comunicación y proporcionar actualizaciones adicionales

Scenario: Ingresar al entorno “Comentarios” de una tarea
    Dado que el usuario se encuentra en el entorno <Detalles de tarea> 
    Cuando el usuario haga clic en el botón <Agregar Comentario>
    Entonces se le redirige al entorno <Agregar Comentario> de la tarea

Examples: Datos de entrada
    | Agregar Comentario |
    | Agregar Comentario |

Examples: Datos de salida
    | Ninguno |

Scenario: Ingresar al entorno “Comentarios” de un proyecto
    Dado que el usuario se encuentra en el entorno <Detalles del proyecto> 
    Cuando el usuario haga clic en el botón <Agregar Comentario>
    Entonces se le redirige al entorno <Agregar Comentario> del proyecto

Examples: Datos de entrada
    | Agregar Comentario |
    | Agregar Comentario |

Examples: Datos de salida
    | Ninguno |

Scenario: Agregar comentario a una tarea
    Dado que el usuario se encuentra en el entorno <Agregar Comentario>
    Cuando el usuario redacta un <comentario>
    Y da clic en el botón de <Publicar>
    Entonces se muestra el comentario en la sección <Comentarios> de la tarea, 
        junto con el <nombre del usuario> y la <fecha de publicacion> del comentario

Examples: Datos de entrada
    | comentario | Publicar | 
    | Tu trabajo está increíble! | Publicar | 

Examples: Datos de salida
    | nombre del usuario | fecha de publicacion |
    | Javier Mendoza | 29/10/2023 |

Scenario: Agregar comentario a un proyecto
    Dado que el usuario se ubica en el entorno <Agregar Comentario>
    Cuando el usuario redacta un <comentario>
    Y haga clic en el botón de <Publicar>
    Entonces se muestra el comentario en la sección <Comentarios> del proyecto, 
        junto con el <nombre del usuario> y la <fecha de publicacion> del comentario

Examples: Datos de entrada
    | comentario | Publicar | 
    | Tu trabajo está increíble! | Publicar | 

Examples: Datos de salida
    | nombre del usuario | fecha de publicacion |
    | Javier Mendoza | 29/10/2023 |

Scenario: Ver comentarios en una tarea
    Dado que el usuario se ubica en el entorno <Detalles de tarea> 
    Cuando el usuario haga clic en el botón <Ver Comentarios>
    Entonces se muestran todos los <comentarios> anteriores en orden descendente, 
        según la <fecha de publicacion>
    Y el usuario puede visualizar el contenido de cada <comentario>, 
        junto con el <nombre del autor> y la <fecha de publicacion>

Examples: Datos de entrada
    | Ver Comentarios |
    | Ver Comentarios |

Examples: Datos de salida
    | comentario | nombre del autor | fecha de publicacion |
    | Falta implementar la música de fondo | Ariana Melgar | 19/05/2023 | 

Scenario: Ver comentarios de un proyecto
    Dado que el usuario se encuentra en el entorno <Detalles de proyecto> 
    Cuando el usuario haga clic en el botón <Ver Comentarios>
    Entonces se muestran todos los <comentarios> anteriores en orden descendente,
        según la <fecha de publicacion>
    Y el usuario puede visualizar el contenido de cada <comentario>
        junto con el <nombre del autor> y la <fecha de publicacion>

Examples: Datos de entrada
    | Ver Comentarios |
    | Ver Comentarios |

Examples: Datos de salida
    | comentario | nombre del autor | fecha de publicacion |
    | Falta implementar la parte gráfica | Angel Anaya | 29/07/2023 | 

#Feature 11------------------------------------------------------------------------------------------------------------------------

Feature: Notificaciones de actualizaciones
    Como usuario 
    Quiero recibir notificaciones cuando haya actualizaciones en los proyectos 
    y tareas en los que estoy involucrado
    Para conocer sobre el avance del proyecto

Scenario: Notificación de actualización en una tarea asignada
    Dado que el usuario cuenta con una <tarea> asignada
    Cuando otro usuario realiza una actualización en la <tarea> (cambio de <estado>, <comentario>)
    Entonces el usuario recibe una <notificacion> en tiempo real 
        o por correo electrónico sobre la actualización realizada
    Y puede acceder directamente a la <tarea> desde la <notificacion> para ver los detalles actualizados

Examples: Datos de entrada
    | Ninguno |

Examples: Datos de salida
    | tarea | estado | comentario | notificacion |
    | Tarea 1 | Completada | Terminamos | Se ha completado la tarea "Tarea 1" |

Scenario: Notificación de actualización en un proyecto
    Dado que el usuario está participando en un <proyecto>
    Cuando otro usuario realiza una actualización en el <proyecto> (agrega <tareas>, <comentarios>)
    Entonces el usuario recibe una <notificacion> en tiempo real 
        o por correo electrónico sobre la actualización realizada
    Y puede acceder directamente al <proyecto> desde la <notificacion> para ver los detalles actualizados

Examples: Datos de entrada
    | Ninguno |

Examples: Datos de salida
    | proyecto | estado | comentario | notificacion |
    | YMCA | Completada | Terminamos | Se ha completado el proyecto "YMCA" |

Scenario: Entrar al entorno “Notificaciones”
    Dado que el usuario se ubica al entorno <Configuracion> de mi perfil
    Cuando el usuario haga clic en el botón <Notificaciones>
    Entonces se le redirige al entorno <Notificaciones>

Examples: Datos de entrada
    | Notificaciones |
    | Notificaciones |

Examples: Datos de salida
    | Ninguno |

Scenario: Editar Notificaciones
    Dado que el usuario se encuentra en el entorno <Notificaciones>
    Cuando el usuario ajuste sus preferencias de <notificacion> (<notificaciones en tiempo real>, 
    <notificaciones por correo electronico>, <tipos de actualizaciones que deseo recibir>)
    Entonces el usuario comienza a recibir las <notificaciones> según las preferencias configuradas
    Y se muestra un <mensaje>, indicando que se guardaron los cambios realizados correctamente

Examples: Datos de entrada
    | notificaciones en tiempo real | notificaciones por correo electronico | tipos de actualizaciones que deseo recibir |
    | sí | no | todas |

Examples: Datos de salida
    | mensaje |
    | Cambios guardados exitosamente |

#Feature 12------------------------------------------------------------------------------------------------------------------------

Feature: Mensajería interna
    Como usuario
    Quiero poder enviar y recibir mensajes internos con otros miembros del equipo 
    Para facilitar la comunicación y la colaboración.

Scenario: Entrar al entorno “Mensajes”
    Dado que el usuario se encuentra en la página principal
    Cuando el usuario haga clic en el botón <Mandar Mensaje>
    Entonces se redirige al usuario hacia el entorno <Mensajes>

Examples: Datos de entrada
    | Mandar Mensaje |
    | Mandar Mensaje |

Examples: Datos de salida
    | Ninguno |

Scenario: Seleccionar destinatario
    Dado que el usuario se encuentra en el entorno <Mensajes>
    Cuando el usuario seleccione al <destinatario> del <mensaje> de 
        la lista de <usuarios> disponibles
    Entonces se enviará el <mensaje> al <usuario> elegido

Examples: Datos de entrada
    | destinatario | mensaje | usuarios |
    | Jesus Palomino | Hola Jesus | Manuel Melgar |

Examples: Datos de salida
    | Ninguno |

Scenario: Enviar mensaje a un miembro del equipo
    Dado que el usuario se encuentra en el entorno <Mensajes>
    Cuando el usuario redacte un <mensaje>
    Entonces el <mensaje> se envía al <destinatario> elegido
    Y se muestra el mensaje en la conversación de mensajería

Examples: Datos de entrada
    | destinatario | mensaje |
    | Cesar Torres | Hola Cesar |

Examples: Datos de salida
    | Ninguno |

Scenario: Enviar mensaje a ninguna persona
    Dado que el usuario se encuentra en el entorno <Mensajes>
    Cuando el usuario redacte un <mensaje>
    Y el usuario no ha elegido a ningún <destinatario>
    Entonces se muestra un <mensaje de error>, indicando que no hay ningún <destinatario>

Examples: Datos de entrada
    | destinatario | mensaje |
    |  | Excelente Trabajo |

Examples: Datos de salida
    | mensaje de error |
    | Debe seleccionar a un destinatario para enviar el mensaje |

Scenario: Enviar mensaje vacío
    Dado que el usuario se encuentra en el entorno <Mensajes>
    Cuando el usuario intente enviar un <mensaje> sin haber redactado uno
    Entonces se muestra un <mensaje de error>, indicando que no se puede enviar un <mensaje> vacío

Examples: Datos de entrada
    | mensaje |
    |  |

Examples: Datos de salida
    | mensaje de error |
    | No se pueden enviar mensajes vacíos |

Scenario: Ver mensajes recibidos
    Dado que el usuario tiene <mensajes> recibidos en su bandeja de entrada
    Cuando el usuario entre al entorno <Mensajes>
    Entonces se muestran los <mensajes> recibidos en orden descendente según la <fecha de recepcion>
    Y el usuario puede visualizar el contenido de cada <mensaje>, junto con el
        <nombre del remitente> y la <fecha de recepcion>

Examples: Datos de entrada
    | mensaje |
    | Debemos terminar el trabajo de IHC |

Examples: Datos de salida
    | fecha de recepcion | nombre del remitente |
    | 10/10/2023 | Marcelo Neyra |

Scenario: Responder a un mensaje
    Dado que el usuario se encuentre en al entorno <Mensajes>
    Cuando el usuario redacte una <respuesta> a un <mensaje> recibido
    Entonces el <mensaje> se envía correctamente al <remitente> original
    Y se muestra la <respuesta> en la conversación de mensajería

Examples: Datos de entrada
    | mensaje | respuesta |
    | Debemos terminar el trabajo de IHC | Tienes razón. Hoy avanzamos |

Examples: Datos de salida
    | remitente |
    | Gabriel Soto |

#Feature 13------------------------------------------------------------------------------------------------------------------------

Feature: Creación de eventos en el calendario
    Como usuario 
    Quiero poder crear eventos en el calendario para programar reuniones, 
        fechas límite y otros eventos relevantes 
    Para el buen seguimiento proyecto

Scenario: Ingresar al entorno “Crear Evento”
    Dado que el usuario se ubica en el entorno <Calendario>
    Cuando el usuario seleccione el botón <Crear Evento>
    Entonces el usuario es redirigido al entorno <Crear Evento>

Examples: Datos de entrada
    | Crear Evento |
    | Crear Evento |

Examples: Datos de salida
    | Ninguno |

Scenario: Crear un nuevo evento en el calendario
    Dado que el usuario se ubica en el entorno <Crear Evento>
    Cuando el usuario ingrese los detalles del <evento> 
        necesarios (<fecha>, <hora>, <titulo>, <descripcion>)
    Entonces los detalles del <evento> se visualizarán 
        correctamente en el <calendario> en la <fecha> indicada

Examples: Datos de entrada
    | evento | fecha | hora | titulo | descripcion |
    | Debugging | 31/10/2023 | 15:00:00 | Debugging | Arreglar los errores del programa |

Examples: Datos de salida
    | evento |
    | Debugging, 31/10/2023, 15:00:00, Arreglar los errores del programa |

Scenario: Ingresar al entorno “Editar Evento”
    Dado que el usuario se ubica en el entorno <Calendario>
    Cuando el usuario seleccione el botón <Editar Evento>
    Entonces se redirige al usuario al entorno <Editar Evento>

Examples: Datos de entrada
    | Editar Evento |
    | Editar Evento |

Examples: Datos de salida
    | Ninguno |

Scenario: Editar un evento existente en el calendario
    Dado que el usuario se ubica en el entorno <Editar Evento>
    Cuando el usuario seleccione un <evento> existente en el calendario
    Y el usuario realice cambios en cualquiera de los detalles del <evento>
    Entonces los detalles del <evento> modificado se visualizarán correctamente
        en el <calendario> en la nueva <fecha> indicada

Examples: Datos de entrada
    | evento |
    | Debugging, 31/10/2023, 15:00:00, Arreglar los errores del programa |

Examples: Datos de salida
    | evento |
    | Debugging, 02/11/2023, 15:00:00, Arreglar los errores del programa |

Scenario: Eliminar un evento del calendario
    Dado que el usuario se ubica en el entorno <Calendario>
    Cuando el usuario seleccione un <evento> existente en el <calendario>
    Y el usuario haga clic en <Eliminar Evento>
    Entonces el <evento> ya no se muestra en la lista de <eventos> programados

Examples: Datos de entrada
    | Eliminar Evento | evento |
    | Eliminar Evento | Debugging, 02/11/2023, 15:00:00, Arreglar los errores del programa |

Examples: Datos de salida
    | evento |
    |  |

#Feature 14------------------------------------------------------------------------------------------------------------------------

Feature: Recordatorios de eventos
    Como usuario
    Quiero recibir recordatorios de eventos programados en el calendario 
    Para no perder fechas importantes y estar al tanto de mis compromisos

Scenario: Ingresar al entorno “Recordatorio”
    Dado que el usuario se ubica en el entorno <Calendario>
    Cuando el usuario haga clic en <Recordatorio>
    Entonces se le redirige al usuario al entorno <Recordatorio>

Examples: Datos de entrada
    | Editar Evento |
    | Editar Evento |

Examples: Datos de salida
    | Ninguno |

Scenario: Configurar un recordatorio para un evento
    Dado que el usuario se ubica en el entorno <Recordatorio>
    Cuando el usuario establezca un <recordatorio> con una <hora> o <tiempo> específico antes del <evento>
    Entonces el usuario recibirá una <notificacion> o <recordatorio> en el momento especificado

Examples: Datos de entrada
    | recordatorio | 
    | Examinar la página, 19:00:00 |

Examples: Datos de salida
    | notificacion |
    | Recordatorio: Examina la página |

Scenario: Desactivar o eliminar un recordatorio para un evento
    Dado que el usuario se ubica en el entorno <Calendario>
    Cuando el usuario seleccione un <recordatorio>
    Y el usuario haga clic en <Eliminar>
    Entonces el usuario no recibirá ninguna <notificacion> o <recordatorio> para ese <evento>

Examples: Datos de entrada
    | recordatorio | Eliminar |
    | Examinar la página, 19:00:00 | Eliminar Recordatorio |

Examples: Datos de salida
    | notificacion |
    |  |
    
#Feature 15------------------------------------------------------------------------------------------------------------------------

Feature: Visualización de eventos por proyecto
    Como usuario
    Quiero poder ver los eventos programados en el calendario específicamente de un proyecto en particular
    Para tener una visión general de los eventos relacionados con ese proyecto
    
Scenario: Ver eventos programados para un proyecto en el calendario
    Dado que el usuario se ubica en el entorno <Calendario>
    Cuando el usuario seleccione el botón <Eventos>
    Entonces se muestran solo los <eventos> programados para 
        los proyectos a los que el <usuario> está asignado en el calendario

Examples: Datos de entrada
    | Eventos |
    | Filtrar Eventos |

Examples: Datos de salida
    | eventos |
    | Reunión Privada - Proyecto: Starlight |

#Feature 16------------------------------------------------------------------------------------------------------------------------

Feature: Etiquetado de tareas y proyectos
    Como usuario
    Quiero poder etiquetar tareas y proyectos con etiquetas descriptivas 
    Para una mejor organización y búsqueda

Scenario: Etiquetar una tarea con una etiqueta específica
    Dado que el usuario está ubicado en <Detalles de tarea>
    Cuando el usuario seleccione el botón <Etiquetar>
    Y el usuario elija una <etiqueta> descriptiva
    Entonces el usuario puede visualizar la <etiqueta> asociada a la <tarea>

Examples: Datos de entrada
    | Etiquetar |
    | Etiquetar Tarea |

Examples: Datos de salida
    | etiqueta |
    | Pendiente |

Scenario: Etiquetar un proyecto con una etiqueta específica
    Dado que el usuario está ubicado en <Detalles de proyecto>
    Cuando el usuario seleccione el botón <Etiquetar> 
    Y el usuario elija una <etiqueta> descriptiva
    Entonces el usuario ver la <etiqueta> asociada al proyecto

Examples: Datos de entrada
    | Etiquetar |
    | Etiquetar Tarea |

Examples: Datos de salida
    | etiqueta |
    | Pendiente |

#Feature 17------------------------------------------------------------------------------------------------------------------------

Feature: Filtrado por Etiquetas
    Como usuario
    Quiero poder filtrar tareas y proyectos basándome en etiquetas 
    Para acceder rápidamente a los elementos relacionados

Scenario: Filtrar tareas por una etiqueta específica
    Dado que el usuario está ubicado en <Detalles de tarea>
    Cuando el usuario seleccione una <etiqueta> específica para filtrar las tareas
    Entonces se muestran solo las <tareas> que están etiquetadas con la <etiqueta> seleccionada

Examples: Datos de entrada
    | etiqueta |
    | Pendiente |

Examples: Datos de salida
    | etiqueta | tareas |
    | Pendiente | Ordenar el arreglo, Arreglar la PC |

Scenario: Filtrar proyectos por una etiqueta específica
    Dado que el usuario está ubicado en <Detalles de proyecto>
    Cuando el usuario seleccione una <etiqueta> específica para filtrar los proyectos
    Entonces se muestran solo los <proyectos> que están etiquetados con la <etiqueta> seleccionada

Examples: Datos de entrada
    | etiqueta |
    | Importante |

Examples: Datos de salida
    | etiqueta | proyectos |
    | Importante | SuperNova, XtremeGames, Delightful Images |
    
#Feature 18------------------------------------------------------------------------------------------------------------------------

Feature: Desarrollo de aplicación móvil para usuarios
    Como usuario, 
    Quiero tener acceso a la plataforma a través de una aplicación móvil 
    Para poder gestionar tareas y proyectos desde mi dispositivo móvil
    
Scenario: Descargar e instalar la aplicación móvil
    Dado que el usuario cuente con dispositivo móvil
    Cuando el usuario instale la aplicación en su dispositivo móvil
    Entonces la aplicación se instala correctamente en su dispositivo móvil
    Y puedo el usuario puede ver el <icono> de la aplicación en la pantalla de inicio

Examples: Datos de entrada
    | Ninguno |

Examples: Datos de salida
    | icono |
    | Workline.jpg |

Scenario: Iniciar sesión en la aplicación móvil
    Dado que el usuario se encuentra en la página de inicio de sesión de la aplicación móvil
    Cuando el usuario proporcione sus <credenciales> de usuario
    Entonces se inicia sesión correctamente en la aplicación móvil
    Y el usuario puede acceder a sus <tareas> y <proyectos> desde la aplicación

Examples: Datos de entrada
    | credenciales |
    | Esteban Lopez, est123, esteban123@gmail.com |

Examples: Datos de salida
    | tareas | proyectos |
    | Tarea 1, Tarea 2, Tarea 3 | Proyecto 1, Proyecto 2, Proyecto 3 |

Scenario: Gestionar tareas y proyectos desde la aplicación móvil
    Dado que el usuario se encuentra logueado en la aplicación móvil
    Cuando el usuario realice acciones como crear, editar o eliminar <tareas> y/o <proyectos>
    Entonces los cambios se reflejan en la plataforma web y en la aplicación móvil
  
Examples: Datos de entrada
    | Ninguno |

Examples: Datos de salida
    | Ninguno |

#Feature 19------------------------------------------------------------------------------------------------------------------------

Feature: Notificaciones en la aplicación móvil
    Como usuario
    Quiero recibir notificaciones en la aplicación móvil 
    Para estar informado sobre actualizaciones, recordatorios 
        y eventos importantes relacionados con mis tareas y proyectos
    
Scenario: Recibir notificación de actualización en una tarea
    Dado que el usuario cuenta con la aplicación móvil instalada
    Cuando se realiza una actualización de una <tarea> asignada al usuario
    Entonces el usuario recibe una <notificacion> en la aplicación móvil
    Y el usuario puede ver el contenido de la actualización accediendo directamente desde la <notificacion>

Examples: Datos de entrada
    | Ninguno |

Examples: Datos de salida
    | notificacion |
    | Se ha realizado cambios al Proyecto 1 |

Scenario: Recibir notificación de recordatorio de evento
    Dado que el usuario cuenta con la aplicación móvil instalada
    Cuando se acerca la fecha y hora de un <evento> programado en mi calendario
    Entonces el usuario recibe una <notificacion> en la aplicación móvil como recordatorio del evento
    Y el usuario puede ver la información del evento y acceder a los detalles de este

Examples: Datos de entrada
    | Ninguno |

Examples: Datos de salida
    | notificacion |
    | Se ha acerca el evento "Entrega del Proyecto de IHC" |

Scenario: Recibir notificación de reconocimiento
    Dado que el usuario cuenta con la aplicación móvil instalada
    Cuando otro usuario le envié una <notificacion> de reconocimiento
    Entonces el usuario recibirá la <notificacion> reconocimiento, 
        indicando el <usuario> que lo felicitó y el <mensaje> de la <notificacion>

Examples: Datos de entrada
    | Ninguno |

Examples: Datos de salida
    | notificacion | usuario | mensaje |
    | Mateo Roggero le ha mandado una notificación de reconocimiento | Mateo Roggero 
        | Felicitaciones. Acabó un trabajo impecable y a tiempo. |

#Feature 20------------------------------------------------------------------------------------------------------------------------

Feature: Programación de copias de seguridad
    Como usuario
    Quiero poder programar copias de seguridad automáticas 
        de mis datos en la plataforma 
    Para asegurar su respaldo y disponibilidad en caso 
        de cualquier eventualidad

Scenario: Configurar programación de copias de seguridad
    Dado que soy el usuario está registrado en la plataforma
    Cuando el usuario acceda a la configuración de su <cuenta>
    Y el usuario seleccione el botón <Programar copias de seguridad>
    Entonces se le presentan al usuario <opciones> para establecer 
        la <frecuencia> y el momento de las copias de seguridad automáticas

Examples: Datos de entrada
    | Programar copias de seguridad |
    | Programar frecuencia de copias de seguridad |

Examples: Datos de salida
    | frecuencia |
    | Cada 30 días |

Scenario: Ejecutar copia de seguridad programada
    Dado que el usuario ha configurado la programación de copias de seguridad en la plataforma
    Cuando llega el momento programado para realizar la copia de seguridad
    Entonces se ejecuta automáticamente la copia de seguridad de los datos del usuario en la plataforma
    Y se guarda el respaldo de manera segura para su posterior recuperación en caso necesario

Examples: Datos de entrada
    | Ninguno |

Examples: Datos de salida
    | Ninguno |

#Feature 21------------------------------------------------------------------------------------------------------------------------

Feature: Agregar Amigos
    Como usuario
    Quiero poder agregar amigos, 
    Para así tener un listado de todos los amigos que tengo 
        que también utilicen la aplicación Workline
    
Scenario: Entrar al entorno "Amigos"
    Dado que el usuario se encuentra en la página principal
    Cuando el usuario seleccione el botón <Amigos>
    Entonces se le redirige al entorno <Amigos>

Examples: Datos de entrada
    | Amigos |
    | Amigos |

Examples: Datos de salida
    | Ninguno |

Scenario: Buscar amigos
    Dado que el usuario se encuentra en el entorno <Amigos>
    Cuando el usuario escriba el <nombre> del <usuario> del que quiere volverse amigo
    Entonces aparecerá el nombre del <usuario> que fue escrito
    Y aparecerán las opciones <Mandar solicitud de amistad> y <Bloquear usuario>

Examples: Datos de entrada
    | nombre |
    | Mauricio Moscoso |

Examples: Datos de salida
    | Mandar solicitud de amistad | Bloquear usuario |
    | Mandar solicitud de amistad | Bloquear usuario |

Scenario: Mandar una solicitud de amistad
    Dado que el usuario ha encontrado al usuario del cual quiere volverse amigo
    Cuando el usuario seleccione el botón <Mandar solicitud de amistad>
    Entonces se enviará una <notificacion> al <usuario> seleccionado
    Y aparecerá un <mensaje de confirmacion>, indicando que la solicitud 
        de amistad fue enviada satisfactoriamente

Examples: Datos de entrada
    | Mandar solicitud de amistad | usuario |
    | Mandar solicitud de amistad | Mauricio Moscoso |

Examples: Datos de salida
    | notificacion | mensaje de confirmacion |
    | El usuario Marcelo Neyra le ha enviado una solicitud de amistad
        | Se ha enviado una solicitud de amistad al usuario Maurcio Moscoso |

Scenario: Ya fue enviada una solicitud de amistad
    Dado que el usuario ha encontrado al usuario al cual ya le mandó una solicitud de amistad
    Cuando el usuario seleccione el botón <Mandar solicitud de amistad>
    Entonces aparecerá un <mensaje>, indicando que una solicitud de amistad ya fue enviada

Examples: Datos de entrada
    | Mandar solicitud de amistad | usuario |
    | Mandar solicitud de amistad | Mauricio Moscoso |

Examples: Datos de salida
    | mensaje |
    | Ya le ha enviado anteriormente una solicitud de amistad al usuario Maurcio Moscoso |

#Feature 22------------------------------------------------------------------------------------------------------------------------

Feature: Bloqueo de Usuarios
    Como usuario
    Quiero poder bloquear usuario
    Para así no tener que lidiar con personas problemáticas 
        dentro de la aplicación Workline

Scenario: Bloquear a un Usuario
    Dado que el usuario ha encontrado al <usuario> el cual quiere bloquear
    Cuando el usuario seleccione el botón <Bloquear>
    Entonces aparecerá un <mensaje de confirmacion>, indicando que el <usuario> fue bloqueado
    Y el nombre del usuario bloqueada aparecerá bajo la sección <Usuarios Bloqueados>

Examples: Datos de entrada
    | Bloquear | usuario |
    | Bloquear Usuario | Jamil Tapia |

Examples: Datos de salida
    | mensaje de confirmacion |
    | Se ha bloqueado al usuario Jamil Tapia |

Scenario: Desbloquear a un Usuario
    Dado que el usuario se encuentra sección <Usuarios Bloqueados>
    Cuando el usuario seleccione al <usuario> elegido
    Y seleccione <Desbloquear>
    Entonces el usuario ya no aparecerá bajo la sección <Usuarios Bloqueados>
    Y aparecerá un <mensaje de confirmacion>, indicando que el usuario ha
        sido desbloqueado

Examples: Datos de entrada
    | Desbloquear | usuario |
    | Desbloquear Usuario | Jamil Tapia |

Examples: Datos de salida
    | mensaje de confirmacion |
    | Se ha desbloqueado al usuario Jamil Tapia satisfactoriamente |
    
#Feature 23------------------------------------------------------------------------------------------------------------------------

Feature: Configuración de Lista de Amigos
    Como usuario
    Quiero tener la capacidad de configurar mi lista de amigos
    Para así tener un mayor control sobre las personas que tengo agregadas como amigos
    
Scenario: Visualizar opciones de amistad
    Dado que el usuario se encuentra en el entorno <Amigos>
    Cuando el usuario seleccione uno de los recuadros de <amigos>
    Entonces se visualizará las opciones <Marcar como Mejor Amigo>, <Eliminar> y <Bloquear>

Examples: Datos de entrada
    | amigos |
    | Angel Anaya, Kevin Ayquipa, Jesus Palomino, Cesar Torres |

Examples: Datos de salida
    | Marcar como Mejor Amigo | Eliminar | Bloquear |
    | Marcar como Mejor Amigo | Eliminar Usuario | Bloquear Usuario |

Scenario: Marcar como "Mejor amigo" a un amigo
    Dado que el usuario ha seleccionado a uno de sus <amigos>
    Cuando el usuario seleccione la opción <Marcar como Mejor Amigo>
    Entonces se marcará al <amigo> elegido como <Mejor Amigo>
    Y aparecerá un <mensaje de confirmacion>, indicando que el <amigo> es ahora un <Mejor Amigo>
    Y el <amigo> elegido ahora aparecerá bajo la sección <Mejores Amigos>

Examples: Datos de entrada
    | amigos | Marcar como Mejor Amigo |
    | Angel Anaya, Kevin Ayquipa, Jesus Palomino, Cesar Torres | Marcar como Mejor Amigo |

Examples: Datos de salida
    |  mensaje de confirmacion |
    |  Se ha marcado como mejor amigo a Angel Anaya |

Scenario: Eliminar a un amigo
    Dado que el usuario ha seleccionado a uno de sus <amigos>
    Cuando el usuario seleccione la opción <Eliminar>
    Entonces se eliminará al <amigo> seleccionado de la <lista de amigos>
    Y se mostrará un <mensaje de confirmacion>, indicando que el <amigo> fue eliminado

Examples: Datos de entrada
    | amigos | Eliminar |
    | *Angel Anaya*, Kevin Ayquipa, Jesus Palomino, Cesar Torres | Eliminar Usuario |

Examples: Datos de salida
    |  mensaje de confirmacion |
    |  Se ha eliminado a Kevin Ayquipa de su lista de amigos |

Scenario: Bloquear a un amigo
    Dado que el usuario ha seleccionado a uno de sus <amigos>
    Cuando el usuario seleccione la opción <Bloquear>
    Entonces el <amigo> seleccionado será bloqueado
    Y aparecerá un <mensaje de confirmacion>, indicando que el <amigo> fue bloqueado
    Y el nombre del <amigo> aparecerá bajo la sección <Usuarios Bloqueados>

Examples: Datos de entrada
    | amigos | Bloquear |
    | *Angel Anaya*, Jesus Palomino, Cesar Torres | Bloquear Usuario |

Examples: Datos de salida
    |  mensaje de confirmacion |
    |  Se ha bloqueado a Jesus Palomino |

Scenario: Desmarcar como "Mejor Amigo"
    Dado que el usuario se encuentra en la sección <Mejores Amigos>
    Cuando el usuario seleccione al amigo
    Y seleccione <Desmarcar como Mejor Amigo>
    Entonces el amigo seleccionado ya no aparecerá bajo la sección <Mejores Amigos>
    Y aparecerá un <mensaje de confirmacion>, indicando que el amigo seleccionado ya no es <Mejores Amigo>

Examples: Datos de entrada
    | Desmarcar como Mejor Amigo |
    | Desmarcar como Mejor Amigo |

Examples: Datos de salida
    |  mensaje de confirmacion |
    |  Angel Anaya ya no es un Mejor Amigo |

#Feature 24------------------------------------------------------------------------------------------------------------------------

Feature: Configuración de Audio
    Como usuario
    Quiero poder ajustar el audio según mis preferencias 
    Para tener una mejor experiencia al trabajar con la aplicación Workline

Scenario: Entrada a la sección "Audio"
    Dado que el usuario se encuentra en el entorno <Configuracion General>
    Cuando el usuario seleccione el botón <Configurar Audio>
    Entonces aparecerán las opciones <videoconferencia> y <notificacion>
    Y una barra <slider> al lado de ellas para ajustar el <volumen> del sonido

Examples: Datos de entrada
    | Configuracion Audio | 
    | Configuracion Audio | 

Examples: Datos de salida
    | videoconferencia | notificacion |
    | Videoconferencia | Notificaciones | 

Scenario: Guardar Cambios
    Dado que el usuario ha interactuado con la barra <slider> de una de las opciones
    Cuando el usuario seleccione el botón <Guardar Cambios>
    Entonces aparecerá un <mensaje>, indicando que se han guardado los cambios realizados

Examples: Datos de entrada
    | Guardar Cambios | 
    | Guardar Cambios | 

Examples: Datos de salida
    | mensaje |
    | Se han guardado los cambios | 

Scenario: Probar el volumen
    Dado que el usuario ha interactuado con la barra <slider> de una de las opciones
    Cuando el usuario seleccione el botón <Probar>
    Entonces sonará un audio corto con el <volumen> indicado por el usuario

Examples: Datos de entrada
    | Probar | 
    | Probar Volumen | 

Examples: Datos de salida
    | audio |
    | audio_prueba.wav | 

#Feature 25------------------------------------------------------------------------------------------------------------------------

Feature: Configuración de Estilo
    Como usuario
    Quiero poder cambiar el estilo de la aplicación 
    Para facilitar y mejorar mi experiencia al utilizar la aplicación Workline

Scenario: Entrada la sección "Estilos"
    Dado que el usuario se encuentra en el entorno <Configuracion General>
    Cuando el usuario seleccione el botón <Configurar Estilo>
    Entonces aparecerá la sección <Estilos>

Examples: Datos de entrada
    | Configurar Estilo |
    | Configurar Estilo |

Examples: Datos de salida
    | Estilos |
    | Estilos |

Scenario: Uso de Estilos Predeterminados
    Dado que el usuario se encuentra en la sección <Estilos>
    Cuando el usuario seleccione el botón <Usar Estilos Predeterminados>
    Y seleccione <Si>
    Entonces aparecerán todos los <estilos> predeterminados dentro de una lista

Examples: Datos de entrada
    | Usar Estilos Predeterminados | Si |
    | Usar Estilos Predeterminados | Sí |

Examples: Datos de salida
    | Estilos |
    | Gran Contraste, Elegante |

Scenario: Uso de Estilo Personalizado
    Dado que el usuario se encuentra en la sección <Estilos>
    Cuando el usuario seleccione el botón <Usar Estilos Predeterminados>
    Y seleccione <No>
    Entonces aparecerán cada uno de los <objetos> que el 
        usuario puede configurar con un <color> personalizado

Examples: Datos de entrada
    | Usar Estilos Predeterminados | No |
    | Usar Estilos Predeterminados | No |

Examples: Datos de salida
    | color |
    | Rojo |

Scenario: Guardar Cambios
    Dado que el usuario ha realizado todos los cambios necesarios
    Cuando el usuario seleccione el botón <Guardar Cambios>
    Entonces aparecerá un <mensaje>, indicando que se ha guardado correctamente los cambios realizados

Examples: Datos de entrada
    | Guardar Cambios |
    | Guardar Cambios |

Examples: Datos de salida
    | mensaje |
    | Se han guardado los cambios |

Scenario: Vista Previa de Cambios
    Dado que el usuario ha realizado todos los cambios necesarios
    Cuando el usuario seleccione <Vista Previa>
    Entonces aparecerá una <ventana> que contendrá todos los <objetos> con el <estilo> seleccionado 

Examples: Datos de entrada
    | Vista Previa |
    | Vista Previa |

Examples: Datos de salida
    | ventana |
    | Vista Previa de Estilos |
    
#Feature 26------------------------------------------------------------------------------------------------------------------------

Feature: Crear Plantilla de Estilos
    Como usuario
    Quiero poder crear plantillas de estilos 
    Para poder utilizar una gran variedad de estilos que se adecúen a mis preferencias 
    
Scenario: Crear Plantilla de Estilos
    Dado que el usuario ha configurado su estilo personalizado
    Cuando el usuario seleccione <Guardar como Plantilla>
    Entonces se aparecerá una ventana <Guardar Plantilla>

Examples: Datos de entrada
    | Guardar como Plantilla |
    | Guardar como Plantilla |

Examples: Datos de salida
    | Guardar como Plantilla |
    | Guardar como Plantilla |

Scenario: Guardar Plantilla de Estilos
    Dado que el usuario se encuentra en la venta <Guardar Plantilla>
    Cuando el usuario indique el <nombre> de la <plantilla>
    Y haga clic en <Guardar>
    Entonces aparecerá un <mensaje>, indicando que se ha guardado la <plantilla> correctamente
    Y la <plantilla de estilos> ahora aparecerá bajo la sección <Estilos Predeterminados>

Examples: Datos de entrada
    | nombre | Guardar |
    | Plantilla 1 | Guardar Plantilla |

Examples: Datos de salida
    | mensaje |
    | Se ha creado la plantilla "Plantilla 1" |

Scenario: Guardar Plantilla de Estilos sin nombre
    Dado que el usuario se encuentra en la venta <Guardar Plantilla>
    Cuando el usuario haga clic en <Guardar>
    Entonces aparecerá un <mensaje de error>, indicando que se debe especificar 
        un <nombre> para guardar la <plantilla>

Examples: Datos de entrada
    | nombre | Guardar |
    |  | Guardar Plantilla |

Examples: Datos de salida
    | mensaje |
    | La plantilla necesita un nombre |

Scenario: Acceder a la sección “Borrar Plantilla de Estilos”
    Dado que el usuario se encuentra en la sección <Estilos>
    Cuando el usuario seleccione <Borrar Plantilla de Estilos>
    Entonces aparecerán todas las <plantillas de estilos> que han sido creadas por el usuario

Examples: Datos de entrada
    | Borrar Plantilla de Estilos |
    | Borrar Plantilla de Estilos |

Examples: Datos de salida
    | plantillas de estilos |
    | Plantilla 1, Decolorado, Extra Azul, Espeluznante |

Scenario: Borrar Plantilla de Estilos
    Dado que el usuario ha encontrado la <plantilla de estilos> que desea borrar
    Cuando el usuario seleccione dicha <plantilla>
    Entonces aparecerá un <mensaje>, indicando que se borró la <plantilla de estilos> satisfactoriamente

Examples: Datos de entrada
    | plantilla de estilos |
    | Plantilla 1 |

Examples: Datos de salida
    | mensaje |
    | Se borró la plantilla "Plantilla 1" satisfactoriamente |
 
#Feature 27------------------------------------------------------------------------------------------------------------------------

Feature: Cambiar el idioma
    Como usuario que no habla español con fluidez
    Quiero tener una opción con la que pueda cambiar el idioma 
    Para entender con mayor facilidad la aplicación Workline
    
Scenario: Entrar a la sección “Cambiar el idioma”
    Dado que el usuario se encuentra en el entorno <Configuracion General>
    Cuando el usuario seleccione el botón <Cambiar Idioma>
    Entonces aparecerá la sección <Cambiar Idioma>

Examples: Datos de entrada
    | Cambiar Idioma |
    | Cambiar Idioma |

Examples: Datos de salida
    | Cambiar Idioma |
    | Cambiar Idioma |

Scenario: Cambiar Idioma
    Dado que el usuario se encuentra en la sección <Cambiar Idioma>
    Cuando el usuario seleccione un <idioma>
    Y haga clic en <Guardar>
    Entonces se mostrará un <mensaje de confirmacion>, indicando que se ha cambiado el idioma 
        y que es necesario reiniciar la aplicación para visualizar los cambios

Examples: Datos de entrada
    | idioma |
    | English |

Examples: Datos de salida
    | mensaje |
    | Language changed succesfully. A restart is needed to apply the changes. |

#Feature 28------------------------------------------------------------------------------------------------------------------------

Feature: Ajuste de Datos Personales
    Como usuario
    Quiero poder ajustar mis datos personales
    Para asegurarme que estén actualizados

Scenario: Entrar en el entorno “Datos Personales”
    Dado que el usuario se encuentra en el entorno <Configuracion>
    Cuando el usuario seleccione el botón <Datos Personales>
    Entonces se redirige al usuario al entorno <Datos Personales>

Examples: Datos de entrada
    | Datos Personales |
    | Datos Personales |

Examples: Datos de salida
    | Datos Personales |
    | Datos Personales |

Scenario: Configurar Datos Personales
    Dado que el usuario se encuentra en el entorno <Datos Personales>
    Cuando el usuario cambie cualquiera de los campos de los <datos personales>
    Y hace clic en <Guardar Cambios>
    Entonces aparecerá un <mensaje de confirmacion>, 
        indicando que se ha guardado correctamente los cambios

Examples: Datos de entrada
    | datos personales | Guardar Cambios |
    | nombre, edad, ocupación, fecha de nacimiento | Guardar Cambios |

Examples: Datos de salida
    | mensaje de confirmacion |
    | Se han guardado los cambios |

Scenario: Cambiar un campo a algo prohibido
    Dado que el usuario se encuentra en el entorno <Datos Personales>
    Cuando el usuario cambie uno de los campos de los datos 
        personales a una cadena de caracteres prohibida
    Y hace clic en <Guardar Cambios>
    Entonces aparecerá un <mensaje de error>, 
        indicando que no puede cambiarse el atributo al 
        campo escrito, ya que no está permitido

Examples: Datos de entrada
    | datos personales | Guardar Cambios |
    | nombre, edad, ocupación, fecha de nacimiento | Guardar Cambios |

Examples: Datos de salida
    | mensaje de error |
    | Ese nombre no está permitido |

#Feature 29------------------------------------------------------------------------------------------------------------------------

Feature: Ajuste de Datos de Perfil Público
    Como usuario
    Quiero poder ajustar mis de perfil 
    Para asegurarme que estén actualizados

Scenario: Entrar en el entorno “Datos de Perfil Público”
    Dado que el usuario se encuentra en el entorno <Configuracion>
    Cuando el usuario seleccione el botón <Datos de Perfil Publico>
    Entonces se redirige al usuario al entorno <Datos de Perfil Publico>

Examples: Datos de entrada
    | Datos de Perfil Publico |
    | Datos de Perfil Publico |

Examples: Datos de salida
    | Ninguno |

Scenario: Configurar Datos de Perfil Público
    Dado que el usuario se encuentra en el entorno <Datos de Perfil Publico>
    Cuando el usuario cambie cualquiera de los campos de los <datos de perfil publico>
    Y hace clic en <Guardar Cambios>
    Entonces aparecerá un <mensaje de confirmacion>, indicando que se ha guardado correctamente los cambios

Examples: Datos de entrada
    | datos de perfil publico | Guardar Cambios |
    | Apodo, descripcion, foto de perfil | Guardar Cambios |

Examples: Datos de salida
    | mensaje de confirmacion |
    | Se han guardado los cambios |

Scenario: Cambiar un campo a algo prohibido
    Dado que el usuario se encuentra en el entorno <Datos de Perfil Publico>
    Cuando el usuario cambie uno de los campos de los <datos de perfil publico> a 
        una cadena de caracteres prohibida
    Y hace clic en <Guardar Cambios>
    Entonces aparecerá un <mensaje de error>, 
        indicando que no puede cambiarse el atributo al campo escrito, ya que no está permitido

Examples: Datos de entrada
    | datos de perfil publico | Guardar Cambios |
    | Apodo, descripcion, foto de perfil | Guardar Cambios |

Examples: Datos de salida
    | mensaje de error |
    | Ese apodo no está permitido |

#Feature 30------------------------------------------------------------------------------------------------------------------------

Feature: Cambiar Contraseña
    Como usuario
    Quiero poder cambiar mi contraseña 
    Para mantener mi cuenta segura

Scenario: Entrar en el entorno “Contraseña”
    Dado que el usuario se encuentra en el entorno <Configuracion>
    Cuando el usuario seleccione el botón <Contrasenna>
    Entonces se redirige al usuario al entorno <Contrasenna>

Examples: Datos de entrada
    | Contrasenna |
    | Contraseña |

Examples: Datos de salida
    | Ninguno |

Scenario: Contraseña Actual de Confirmación
    Dado que el usuario se encuentra en el entorno <Contrasenna>
    Cuando el usuario intente cambiar la <contrasenna>
    Entonces aparecerá una ventana <Contrasenna de Confirmacion>, 
        indicando que debe llenar el campo con la <contrasenna actual>

Examples: Datos de entrada
    | Contrasenna |
    | pass123 |

Examples: Datos de salida
    | Contrasenna de Confirmacion |
    | Escriba su contraseña actual: |

Scenario: Aparición de Campos para cambiar contraseña
    Dado que el usuario se encuentra en la ventana <Contrasenna de Confirmacion>
    Cuando el usuario ingrese la <contrasenna actual>
    Entonces aparecerán dos campos con los nombres 
        <Nueva Contrasenna> y <Confirmar Contrasenna>

Examples: Datos de entrada
    | Contrasenna actual |
    | pass567 |

Examples: Datos de salida
    | Nueva Contrasenna | Confirmar Contrasenna |
    | pass123 | pass123 |

Scenario: No coincide la contraseña actual con la del campo “Contraseña Actual”
    Dado que el usuario se encuentra en la ventana <Contrasenna de Confirmacion>
    Cuando el usuario ingrese una <contrasenna> diferente a la <actual>
    Entonces aparecerán se mostrará un <mensaje de error>, 
        indicando que la <contrasenna> no coincide con la <actual>

Examples: Datos de entrada
    | Contrasenna actual |
    | pass890 |

Examples: Datos de salida
    | mensaje de error |
    | La contraseña no coincide con la contraseña actual. Intente de nuevo |

Scenario: Cambiar Contraseña
    Dado que el usuario se encuentra en la ventana <Contrasenna de Confirmacion>
    Cuando el usuario escriba en los campos <Nueva Contrasenna> 
        y <Confirmar Contrasenna> la misma <contrasenna>
    Y esta no sea la misma que la <contrasenna actual>
    Y haga clic en <Confirmar>
    Entonces aparecerán un <mensaje de confirmacion>, 
        indicando que se ha guardado la nueva <contrasenna>

Examples: Datos de entrada
    | Nueva Contrasenna | Confirmar Contrasenna | Confirmar |
    | pass123 | pass123 | Confirmar |

Examples: Datos de salida
    | mensaje de confirmacion |
    | La contraseña ha sido cambiada satisfactoriamente |

Scenario: La nueva contraseña es la misma que la actual
    Dado que el usuario se encuentra en la ventana <Contrasenna de Confirmacion>
    Cuando el usuario escriba en los campos <Nueva Contrasenna> 
        y <Confirmar Contrasenna> la misma <contrasenna>
    Y esta es la misma que la <contrasenna actual>
    Y haga clic en <Confirmar>
    Entonces aparecerán un <mensaje de error>, 
        indicando que la nueva <contrasenna> no puede ser la misma que la actual

Examples: Datos de entrada
    | Nueva Contrasenna | Confirmar Contrasenna | Confirmar |
    | pass123 | pass123 | Confirmar |

Examples: Datos de salida
    | mensaje de error |
    | La nueva contraseña no puede ser la misma que la actual |

Scenario: No coincide la contraseña de confirmación con la que se quiere cambiar
    Dado que el usuario se encuentra en la ventana <Contrasenna de Confirmacion>
    Cuando el usuario escriba en los campos <Nueva Contrasenna> 
        y <Confirmar Contrasenna> dos <contrasennas> diferentes
    Y haga clic en <Confirmar>
    Entonces aparecerán un <mensaje de error>, 
        indicando que las <contrasennas> de ambos campos no coinciden

Examples: Datos de entrada
    | Nueva Contrasenna | Confirmar Contrasenna | Confirmar |
    | pass123 | pass567 | Confirmar |

Examples: Datos de salida
    | mensaje de error |
    | Las contraseñas no coinciden. Intente de nuevo |