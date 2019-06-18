-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 18-06-2019 a las 22:35:34
-- Versión del servidor: 10.1.38-MariaDB
-- Versión de PHP: 7.3.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `apaz`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `caracteristicas`
--

CREATE TABLE `caracteristicas` (
  `id` int(11) NOT NULL,
  `nombre_caracteristica` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `caracteristicas`
--

INSERT INTO `caracteristicas` (`id`, `nombre_caracteristica`) VALUES
(24, 'grande'),
(25, 'peluda'),
(26, 'perro'),
(27, 'caso especial'),
(28, 'ppp'),
(29, 'pequeña'),
(30, 'mediana'),
(31, 'cachorro'),
(32, 'adulta'),
(33, 'vejez'),
(34, 'tranquila'),
(35, 'baby-friendly'),
(36, 'nerviosa'),
(37, 'pájaro'),
(38, 'gato'),
(39, 'corredor'),
(40, 'delicada');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `caracteristicas_mascota`
--

CREATE TABLE `caracteristicas_mascota` (
  `id` int(11) NOT NULL,
  `id_caracteristica` int(11) NOT NULL,
  `id_mascota` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `caracteristicas_mascota`
--

INSERT INTO `caracteristicas_mascota` (`id`, `id_caracteristica`, `id_mascota`) VALUES
(51, 29, 76),
(52, 30, 76),
(53, 31, 76),
(54, 39, 76),
(55, 35, 76),
(62, 25, 78),
(63, 29, 78),
(64, 38, 78),
(65, 26, 79),
(66, 29, 79),
(67, 36, 79),
(68, 39, 79),
(69, 35, 79),
(76, 24, 81),
(77, 25, 81),
(78, 40, 81),
(79, 24, 82),
(80, 26, 82),
(81, 36, 82),
(82, 29, 82),
(83, 25, 82),
(88, 26, 83),
(89, 34, 83),
(90, 36, 83),
(91, 31, 84),
(92, 26, 84),
(93, 25, 85),
(94, 24, 85),
(95, 34, 85),
(96, 36, 86),
(97, 38, 86),
(98, 35, 86),
(99, 25, 87),
(100, 30, 87),
(101, 38, 87),
(102, 27, 87),
(103, 37, 88),
(104, 40, 88),
(105, 24, 89),
(106, 26, 89),
(107, 27, 89),
(108, 24, 77),
(109, 25, 77),
(110, 26, 77),
(111, 38, 80),
(112, 40, 80),
(113, 34, 80),
(114, 35, 80),
(115, 32, 90),
(116, 24, 90),
(117, 26, 90),
(118, 27, 90),
(119, 24, 75),
(120, 26, 75),
(121, 34, 75);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estados_mascota`
--

CREATE TABLE `estados_mascota` (
  `id` int(11) NOT NULL,
  `nombre_estado` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `estados_mascota`
--

INSERT INTO `estados_mascota` (`id`, `nombre_estado`) VALUES
(1, 'adoptada'),
(2, 'acogida'),
(3, 'otro');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mascotas`
--

CREATE TABLE `mascotas` (
  `id` int(11) NOT NULL,
  `nombre` varchar(150) NOT NULL,
  `fecha_nacimiento` int(11) DEFAULT NULL,
  `fecha_registro` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `id_estado` int(11) NOT NULL,
  `chip` bigint(15) DEFAULT NULL,
  `genero` tinyint(1) NOT NULL,
  `imagen` varchar(150) NOT NULL,
  `descripcion` text,
  `raza` varchar(200) DEFAULT NULL,
  `id_tipo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `mascotas`
--

INSERT INTO `mascotas` (`id`, `nombre`, `fecha_nacimiento`, `fecha_registro`, `id_estado`, `chip`, `genero`, `imagen`, `descripcion`, `raza`, `id_tipo`) VALUES
(75, 'Edward', 1362438000, '2019-06-18 16:30:53', 3, 111111111111111, 0, '1560885633309-2-1028sm3-1.jpg', '<p><strong>¡¡EDWARD NECESITA ACOGIDA O ADOPCIÓN URGENTEMENTE!! Por favor, si no puedes adoptar o acoger, ayúdanos a difundir. ¡Gracias!</strong></p><p>Nuestro precioso&nbsp;Edward lleva más de año y medio en busca de un hogar y una familia definitiva que parece no llegar nunca...&nbsp;<strong style=\"background-color: rgb(153, 51, 255); color: rgb(255, 255, 255);\">Desgraciadamente, el tiempo va pasando y su cuerpo también va sufriendo cambios.</strong></p><p>Edward sufre una&nbsp;&nbsp;osteoartrosis cadera derecha por displasia congénita&nbsp;y es por este mismo motivo la razón por la que suplicamos un hogar para él.&nbsp;<strong style=\"background-color: rgb(255, 153, 0);\">Edward necesita una casita de acogida en la que esperar su familia definitiva, o aún mejor, ¡un hogar para siempre!</strong></p><p><span style=\"color: rgb(33, 33, 33);\">Edward es un cachito de pan, estrujable y ternito al que no puedes dejar de acariciar. A parte de ser guapísimo, es cariñoso, sociable, juguetón (le encantan las pelotas y salir de paseo) y bonachón.</span></p><p><span style=\"color: rgb(33, 33, 33);\">Por favor, ayúdanos a ayudarlo. ¡Necesita un hogar!</span></p>', 'Mix Buhund', 1),
(76, 'Silvana', 1528063200, '2019-06-18 16:35:52', 3, 2147483647, 1, '1560875752725-52706582_585051835301987_8701241085279910994_n.jpg', '<p>Nuestra preciosa y sonriente&nbsp;<span style=\"background-color: rgb(255, 229, 153);\">SILVANA&nbsp;</span>&nbsp;<strong style=\"background-color: rgb(235, 214, 255);\">fue operada hace ya unos meses y hoy, tras su revisión podemos informaros de que&nbsp;</strong><strong style=\"color: rgb(33, 33, 33); background-color: rgb(235, 214, 255);\">va muy muy bien.</strong><strong style=\"color: rgb(33, 33, 33);\">&nbsp;</strong><span style=\"color: rgb(33, 33, 33);\">Tras varias veces difundida suplicando una casa de acogida donde poder recuperarse, no lo conseguimos... y&nbsp;</span><span style=\"color: rgb(33, 33, 33); background-color: rgb(255, 229, 153);\">SILVANA</span><span style=\"color: rgb(33, 33, 33);\">&nbsp;pasó sus primeros días ingresada en una clínica 24 horas. Días después, el milagro se cumplió y logramos encontrar un hogar temporal para ella.&nbsp;</span></p><p><span style=\"color: rgb(33, 33, 33);\">Ahora, aún en su casita de acogida,&nbsp;</span><strong style=\"color: rgb(33, 33, 33); background-color: rgb(255, 229, 153);\">SILVANA</strong><strong style=\"color: rgb(33, 33, 33);\">&nbsp;tiene ya sus dos patitas operadas y debe seguir su rehabilitación para corregir la postura lo máximo posible. Ambas operaciones han tenido un coste de unos 1.000€ cada una, mas casi 100€ de cada estudio radiográfico que le han hecho, antes de cada operación, después y en sus revisiones. ¡EL TOTAL ASCIENDE A UNOS 3.000€! Pero todo esto ha merecido la pena sólo viendo su carita preciosa.</strong></p><p><span style=\"background-color: rgb(255, 229, 153);\">SILVANA</span>&nbsp;es una perrita llena de vida que parece estar siempre sonriendo.&nbsp;<strong style=\"background-color: rgb(255, 153, 0);\">Es un amor, cariñosisima, muy sociable y muy simpática y juguetona</strong><span style=\"background-color: rgb(255, 153, 0);\">.&nbsp;</span></p><p>Su acogida nos cuenta sobre ella:</p><blockquote><em>\"Silvana es pura alegría! Su problema en las patas de atrás no la limita en nada, ella salta, corre, se sube al sofá, se baja sola... Le Dan brotes de alegría y se pone histérica dando besos jajaja pero es super tierna, muy buena y obediente. Las patas ya las tiene genial, ahora empezaremos con la rehabilitación de la otra pata, y a ver qué tal avanza pero vaya de momento todo genial.\"</em></blockquote><p><br></p><p><br></p>', 'Mix de Bodeguero', 1),
(77, 'Erik', 1270159200, '2019-06-18 18:04:14', 3, 2147483647, 0, '1560883092118-87476-59510618e9a29b845239f2618f49b013-l.jpg', '<p>Este chico tan guapo es&nbsp;<strong>ERIK</strong>, un peludin que fue rescatado hace años una <strong style=\"background-color: rgb(235, 214, 255);\">fría noche de invierno acurrucado, temblando de frío, delgadisimo y con una mirada que rompía el corazón.&nbsp;</strong></p><p>&nbsp;</p><p>A Erik <strong style=\"background-color: rgb(250, 204, 204);\">le encantan las personas. Le encanta saludar, pedirte caricias y ser el centro de atención.</strong><strong> </strong>Es muy muy cariñoso y sociable con más perros con los que le encanta jugar. Es activo con sus momentos de tranquilidad, pues le encanta estar dormidito junto a ti y sentirse seguro, obediente y muy bueno.</p><p><br></p><p>Erik necesita un hogar donde ser feliz para siempre. ¿Nos ayudas a encontrarlo?</p>', 'Mestizo', 1),
(78, 'Arenita', 1417820400, '2019-06-18 18:07:09', 3, 2147483647, 1, '1560881275138-Dyi0lfeVYAA_6Bs.jpg', '<p>Esta preciosidad es&nbsp;<strong style=\"background-color: rgb(255, 255, 204);\">ARENITA</strong>, un caso conmovedor, urgente y muy complicado.&nbsp;&nbsp;<span style=\"color: rgb(33, 33, 33);\">Arenita fue </span><strong style=\"color: rgb(33, 33, 33); background-color: rgb(204, 224, 245);\">rescatada con apenas 1 mes&nbsp;de&nbsp;vida con dificultades para andar.</strong><span style=\"color: rgb(33, 33, 33);\"> Había nacido con una malformación en su pelvis y patas traseras. Arenita estuvo acudiendo a rehabilitación&nbsp;desde muy pequeñita, a sesiones&nbsp;de&nbsp;acupuntura y </span><strong style=\"background-color: rgb(235, 214, 255);\">ha sido operada en varias ocasiones con la esperanza&nbsp;de&nbsp;que&nbsp;pudiera caminar con sus patas trasera</strong><strong style=\"background-color: rgb(204, 224, 245);\">s</strong><strong style=\"color: rgb(235, 214, 255);\">.</strong><span style=\"color: rgb(33, 33, 33);\"> Por&nbsp;desgracia, esto no pudo ser y Arenita no camina con sus patas traseras pero si fue útil para que adoptara una postura más cómoda, y para que no se hiciera&nbsp;heridas.</span></p><p>&nbsp;</p><p><span style=\"color: rgb(33, 33, 33);\">Lo maravilloso&nbsp;de&nbsp;Arenita siempre ha sido sus</span><strong style=\"color: rgb(33, 33, 33);\"> ganas&nbsp;de&nbsp;vivir,</strong><span style=\"color: rgb(33, 33, 33);\">&nbsp;de&nbsp;luchar, la felicidad y alegría que irradia y esa bondad que le hace ser un cachito&nbsp;de&nbsp;pan.&nbsp;Arenita es un caso muy especial, que a pesar&nbsp;de&nbsp;sus dificultades, disfruta&nbsp;de&nbsp;la vida cada segundo. Su acogida nos cuenta que le encanta salir al jardín, que juega como cualquier otro gato, que se sube a todos lados y que tiene una fuerza en sus patas&nbsp;delanteras que asusta! </span><strong style=\"color: rgb(33, 33, 33); background-color: rgb(204, 232, 204);\">Es una gata muy feliz, alegre y muy cariñosa.&nbsp;Es muy sociable con gatos y personas, tranquila, cariñosa, y como dice su acogida, una apasionada&nbsp;de&nbsp;la jardinería.</strong></p>', 'Gato', 2),
(79, 'Ander', 1522965600, '2019-06-18 18:11:13', 3, 2147483647, 0, '1560881473553-295551523.jpg', '<p><span style=\"color: rgb(0, 0, 0);\">Este bodeguerito tan lindo es </span><strong style=\"color: rgb(0, 0, 0); background-color: rgb(204, 224, 245);\">ANDER</strong><span style=\"color: rgb(0, 0, 0);\">, un perrito de poco más de un año que fue </span><strong style=\"color: rgb(0, 0, 0); background-color: rgb(204, 232, 204);\">rescatado en la calle tras haber sido abandonado. Alguien sin corazón lo dejó allí, sobre una manta, y sin poder incorporarse,</strong><span style=\"color: rgb(0, 0, 0);\">&nbsp;</span><strong style=\"color: rgb(0, 0, 0);\">¡tenía una fractura de fémur!&nbsp;</strong><span style=\"color: rgb(0, 0, 0);\">Rápidamente, fue operado y tratado para el dolor. Estuvo durante un tiempo en reposo para una mejor recuperación, y hoy día, ¡esta al 100%!</span></p><p><span style=\"color: rgb(0, 0, 0);\">&nbsp;</span></p><p><span style=\"color: rgb(0, 0, 0);\">Ander es un amorcito en miniatura.</span><strong style=\"color: rgb(0, 0, 0); background-color: rgb(194, 133, 255);\"> Pesa 7\'5 kilos y es muy gracioso, simpático, muy cariñoso, activo y juguetón. Le encanta salir de paseo, recibir caricias, mimos, jugar...</strong><span style=\"color: rgb(0, 0, 0);\"> Esta lleno de vida, alegría y siempre esta dispuesto a aprender cosas nuevas.</span></p>', 'Bodeguero', 1),
(80, 'Anuska', 1559685600, '2019-06-18 18:12:51', 3, 2147483647, 1, '1560883148159-imgID138560725.jpg.gallery.jpg', '<p><span style=\"background-color: rgb(255, 229, 153);\">ANUSKA</span>&nbsp;fue rescatada siendo un bebé de 2 meses con un <strong style=\"background-color: rgb(255, 255, 0);\">prolapso rectal que había necrosado, al borde la muerte</strong>, y tuvo que ser operada de urgencia y, además,<strong>&nbsp;positiva a leucemia.</strong></p><p>Hoy día, años después,&nbsp;<span style=\"background-color: rgb(255, 229, 153);\">Anuska</span>&nbsp;se ha vuelto completa y absolutamente invisible, a pesar de ser una gata&nbsp;<strong>preciosa, sociable, cariñosa, juguetona y muy especial</strong>. Aunque al principio es asustadiza con desconocidos, es muy fácil ganarse su confianza, ya que le&nbsp;<strong style=\"background-color: rgb(255, 235, 204);\">encantan las caricias, los mimos, los juegos, la compañía y el regazo de su humano</strong><span style=\"background-color: rgb(255, 235, 204);\">....</span> pero sobre todas las cosas le encanta&nbsp;<strong>echar siestas al sol.</strong></p><p>&nbsp;</p><p>No entendemos como absolutamente nadie ha querido NUNCA a&nbsp;<span style=\"background-color: rgb(255, 229, 153);\">Anuska</span>.</p><p>¿Quieres ser tú quien abra sus puertas y le de la oportunidad de ser feliz en un&nbsp;<strong>HOGAR</strong>&nbsp;definitivo? ¡Escríbenos!</p>', 'Común Europeo', 2),
(81, 'Candela', 1512514800, '2019-06-18 18:14:33', 3, 2147483647, 1, '1560881874378-cache_30837710.jpg', '<p>Esta es&nbsp;<strong>CANDELA</strong>, una perrita que fue rescatada en una temporada en la que no para de llover y hubieron fuertes tormentas.&nbsp;<strong style=\"background-color: rgb(235, 214, 255);\">Candela salió&nbsp;de debajo de un coche arrastrándose con el rabo entre las patas con heridas, bastante sucia y cargada de pulgas y garrapatas</strong>.&nbsp;</p><p>&nbsp;</p><p>Hoy día, a salvo en su casa de acogida, espera impaciente a ser adoptada.<strong style=\"background-color: rgb(204, 232, 204);\"> Es una perrita muy linda, cariñosa y juguetona. Es sociable y le encanta tomar el sol</strong>, y acurrucarse junto a ti para que la llenes de mimos.</p><p>&nbsp;</p><p>Candela necesita un hogar para siempre, ¿nos ayudas a encontrarlo?</p>', 'Mestizo', 1),
(82, 'Aladdin', 1546383600, '2019-06-18 18:22:42', 3, 2147483647, 0, '1560882162430-9.0.jpg', '<p>&nbsp;<span style=\"background-color: rgb(255, 229, 153);\">ALADDIN</span>, es guapísimo, adorabilísimo, un encantito súper bueno y ya está súper recuperado y dispuesto a marcharse a su nuevo hogar!</p><p>&nbsp;</p><p><strong>¡Al pequeño&nbsp;</strong><strong style=\"background-color: rgb(255, 229, 153);\">ALADDIN</strong><strong>&nbsp;le pasó un coche por encima y le aplastó las patitas!</strong>&nbsp;Como resultado tenía varios huesos fracturados, sus pequeñas patitas estaban totalmente destrozadas, pero ahora, ya operado, se recupera muy rápidamente y está estupendo! ¡Es todo un campeón!</p><p>&nbsp;</p><p><strong>NECESITAMOS COGIDA O ADOPCIÓN URGENTE PARA ÉL!&nbsp;</strong>Él aún sigue en la clínica, porque no tenemos casas disponibles, estamos desbordadas, y este enanito precioso necesita un hogar donde seguir recuperándose, creciendo y aprendiendo como cualquier cachorrito de su edad.</p><p><br></p>', 'Mix', 1),
(83, 'Dulce', 1430863200, '2019-06-18 18:24:34', 3, 2147483647, 1, '1560882346375-captain.jpg', '<p>Cada día que pasa nuestra abuelita&nbsp;DULCE&nbsp;está <strong style=\"background-color: rgb(255, 255, 204);\">más guapa y rejuvenecida</strong>!!&nbsp;Desgraciadamente, nadie ha preguntado por ella&nbsp;desde que fue rescatada y no comprendemos por qué, porque Dulce, como su propio nombre indica, es una dulzura y encanto&nbsp;de&nbsp;perrita!!</p><p>&nbsp;</p><p>Dulce se rescató estando muy enferma y sin poder tener contacto con más perros. Hoy día, hace una vida completamente normal, juega con más perros, <strong style=\"background-color: rgb(204, 224, 245);\">sale a pasear, y se porta fenomenal en su casa&nbsp;de&nbsp;acogida. </strong>Únicamente, acude cada 6-8 meses a su revisión&nbsp;detiroides.&nbsp;Es una perrita muy cariñosa, adorable y sociable, a la que dan ganas&nbsp;de&nbsp;comerse a besos!</p><p>&nbsp;</p><p>Dale a Dulce la oportunidad que tanto necesita! Escríbenos!</p>', 'Mix de beagle', 1),
(84, 'Lanitas', 1559599200, '2019-06-18 18:26:45', 3, 2147483647, 0, '1560882405710-cucciolo-cane1.jpg', '<p><strong>¡NECESITAMOS AYUDA ECONÓMICA PARA&nbsp;LANITAS!&nbsp;</strong></p><p>Por favor, si no puedes adoptar o acoger, ayúdanos a difundir. ¡GRACIAS!</p><p>Desgraciadamente, no tenemos buenas noticias que contar sobre&nbsp;LANITAS... Hace mes y medio aprox. tuvo que ser operado urgentemente por una tumoración el bazo. La operación fue de maravilla, su bazo fue extirpado y se recupero perfectamente. Afortunadamente, conseguimos una casita de acogida para él donde se encuentra actualmente.</p><p>&nbsp;</p><p><span style=\"color: rgb(33, 33, 33);\">Hace unas semanas, Lanitas comenzó a tener un comportamiento poco habitual en él: estaba decaído y débil aunque luchaba por mantener el entusiasmo cuando escuchaba la voz de su acogida.&nbsp;</span><strong>Lanitas comenzó a tener ataques&nbsp;</strong><strong style=\"color: rgb(33, 33, 33);\">epilépticos</strong><strong>&nbsp;con&nbsp;</strong><strong style=\"color: rgb(33, 33, 33);\">asiduidad</strong><strong>&nbsp;lo que nos llevo a una investigación profunda para buscar la causa. Tras pruebas y pruebas, y también, a la espera de más, es muy probable que Lanitas padezca&nbsp;</strong><strong style=\"color: rgb(33, 33, 33);\">LEUCEMIA</strong><strong>.&nbsp;Ayer se le realizo una transfusión de urgencia debido a la gravedad de la anemia que presenta por la perdida de sangre.</strong></p><p>&nbsp;</p><p>Queremos agradecer a su casa de acogida que esta haciendo todo lo posible por mantener la felicidad de Lanitas en estos momentos tan difíciles.&nbsp;<strong>Por favor, necesitamos ayuda para ayudar a Lanitas. Seguiremos informando.</strong></p><p><br></p><p><br></p>', 'MIx', 1),
(85, 'Audrey', NULL, '2019-06-18 18:29:26', 3, 2147483647, 1, '1560882566902-j_agfUd018svcc7itoofzmo32_flwcz4.jpg', '<p><span style=\"background-color: rgb(255, 229, 153);\">AUDREY</span>&nbsp;fue rescatada hace ya varios años. Estaba&nbsp;<strong style=\"background-color: rgb(235, 214, 255);\">atada junto con otro pobre perrito, a una farola en un polígono industrial</strong><span style=\"background-color: rgb(235, 214, 255);\">, </span>estaban terriblemente asustados y estresados... No tenemos ni idea de cuantos días llevarían en esas condiciones.&nbsp;</p><p><span style=\"background-color: rgb(255, 229, 153);\">AUDREY</span>&nbsp;tendrá ahora unos 8 años, y desde entonces<strong>&nbsp;</strong><strong style=\"background-color: rgb(250, 204, 204);\">nadie se ha interesado o tan siquiera preguntado por ella.</strong></p><p><span style=\"background-color: rgb(255, 229, 153);\">AUDREY</span>&nbsp;siempre se ha mostrado tímida y asustadiza, pero el poco tiempo que estuvo acogida, y&nbsp;<strong>supo lo que es un HOGAR</strong>, se <strong style=\"background-color: rgb(204, 232, 204);\">mostró muy&nbsp;tranquila, obediente, y convivió a la perfección con perros y gatos</strong>.</p><p>En la actualidad se la ve muchísimo más contenta y confiada. Es una compañera encantadora a la que&nbsp;<strong>le&nbsp;gusta el contacto con los humanos, otros animales y salir a pasear</strong>. Además, en el coche se comporta perfectamente.</p><p><br></p><p>Esperamos que este bomboncito deje, al fin, de ser&nbsp;<strong>invisible</strong>&nbsp;y que una persona maravillosa se enamore de ella. Ya va siendo hora de que&nbsp;<span style=\"background-color: rgb(255, 229, 153);\">AUDREY</span>&nbsp;encuentre un hogar bueno y definitivo.</p><p>¿Quieres ser tú? ¡Escríbenos!</p>', 'Mix', 1),
(86, 'Aguamarina', NULL, '2019-06-18 18:30:37', 3, 2147483647, 1, '1560882637370-K46I02.jpg', '<p>Hace ya algunas semanas que nos llegaron 9 pequeños víctimas de la vileza humana,&nbsp;<strong style=\"background-color: rgb(194, 133, 255);\">abandonados en una caja de cartón en una colonia felina</strong>, con el resultado de que uno de ellos&nbsp;<strong style=\"background-color: rgb(255, 255, 204);\">murió atropellado</strong>&nbsp;y otro,&nbsp;<span style=\"background-color: rgb(255, 229, 153);\">AGUAMARINA</span>, a punto estuvo de&nbsp;<strong>perderse para siempre</strong>.</p><p>Ahora estos angelitos esperan pacientemente en una casita de acogida a que alguien les ayude a olvidar su pasado, el abandono y la desidia de aquellos que alguna vez fueron responsables (más bien&nbsp;<strong>irreponsables</strong>) de ellos.</p><p>&nbsp;</p><p><span style=\"background-color: rgb(255, 229, 153);\">GEMA Y AGUAMARINA</span>&nbsp;son dos de ellos, dos gatitos&nbsp;<strong style=\"background-color: rgb(235, 214, 255);\">preciosos, sociables, cariñosos y encantadores</strong>&nbsp;que buscan un hogar de verdad, un hogar donde los quieran para siempre y no los vuelvan a dejar a su suerte.</p><p>&nbsp;</p><p>Dos de sus hermanitos ya han sido adoptados juntos.</p><p><strong>¡Llévate un par de joyitas a casa y no te arrepentirás!</strong></p><p>&nbsp;</p><p><strong>¡Adopta y salva vidas!</strong></p>', 'Gato', 2),
(87, 'Gema', 1559772000, '2019-06-18 18:33:11', 3, 2147483647, 1, '1560882791079-lucky.jpg', '<p>¡Hola chic@s! Soy&nbsp;<strong style=\"background-color: rgb(255, 255, 0);\">BOMBÓN</strong>, <strong style=\"background-color: rgb(204, 224, 245);\">un gato ciego y tuerto en el que nadie se ha fijado... </strong>Yo vivía en la calle al igual que muchísimos más... Un día me desperté, comencé mi rutina y ese día, todo cambio, porque es el día en el que estuve a punto de morir. Fui atacado por perros y me dejaron tirado en la calle con heridas muy graves y sin poder moverme.&nbsp;&nbsp;</p><p>&nbsp;</p><p>Pase un largo proceso de recuperación. Estaba muy asustado, me dolía cada centímetro de mi cuerpo, y estaba en un lugar que no era capaz de reconocer. Me había quedado ciego. Me recuperé de mis heridas, uno de mis ojos no fue posible de salvar y tuvieron que quitármelo. <strong style=\"background-color: rgb(194, 133, 255);\">Gracias a mi casa de acogida por comprenderme y ayudarme cada día a superar mis miedos</strong>. Soy un gato al que le gustan los gatos y si, los perros, soy juguetón aunque no pueda ver, me encanta sentir el sol en mi cuerpo, porque sí, aunque no vea, puedo sentir mi alrededor con mi cuerpo. Soy tranquilo, me encanta acurrucarme en la cama, muy listo y hago una vida completamente normal.&nbsp;</p><p>&nbsp;</p><p><strong style=\"background-color: rgb(204, 224, 245);\">Se que soy especial, pues lo he pasado muy mal y necesito tiempo para abrirme ante ti, pero pongo empeño de verás te lo digo.</strong>&nbsp;<strong>No tengo padrinos ni madrinas</strong>, pero por suerte, si tengo una familia temporal que me apoya.&nbsp;</p><p>&nbsp;</p><p>¿Te animas a comenzar una aventura junto a mi?&nbsp;</p>', 'Mix', 2),
(88, 'Coco', 1556748000, '2019-06-18 18:35:27', 3, NULL, 0, '1560882927343-pajaro1.jpg', '<p>Soy <span style=\"background-color: rgb(255, 255, 102);\">COCO </span>un pájaro que no sabe volar bien. Necesito estar siempre apoyado en mi jaula y apenas hago ruido!</p><p>Si quieres conocerme por favor contáctame, soy muy bueno y te haré una muy buena compañía!</p>', 'Canario', 3),
(89, 'Carlo', 1517871600, '2019-06-18 18:36:41', 3, 2147483647, 0, '1560883001108-sobaka_v_veterinaru6-540x560.jpg', '<p>Este es <strong style=\"background-color: rgb(255, 255, 0);\">CARLO</strong>, un perrito que fue rescatado <strong style=\"background-color: rgb(204, 224, 245);\">siendo un cachorro de 3 meses de edad tremendamente asustado de las personas. </strong>Carlo era un perrito peculiar, pues tenía muchas zonas sin pelo por su cuerpo.&nbsp;&nbsp;Actualmente,&nbsp;toma un tratamiento contra la alopecia que sufre y continuamos buscando la razón por la que a Carlo no le crece pelo en determinadas zonas.</p><p>&nbsp;</p><p>Desde que fue rescatado, nadie se ha fijado en él. <strong style=\"background-color: rgb(102, 163, 224);\">Es un perrito muy cariñoso, con una mirada llena de ternura y de agrademiento</strong>, y muy juguetón. Continúa superando sus miedos ante los desconocidos, pero poco a poco se van quedando atrás.</p><p>&nbsp;</p><p><strong style=\"background-color: rgb(255, 255, 204);\">Carlo busca a alguien tan especial como él, que lo quiera para siempre y que sea su compañero fiel, ¿eres tú?</strong></p>', 'Cruce de cocker', 1),
(90, 'Gafitas', 1559685600, '2019-06-18 19:14:48', 2, 2147483647, 0, '1560885288149-F10D06CB-514E-456A-B3E1-609780C67C30.jpeg', '<p><span style=\"background-color: rgb(255, 229, 153);\">GAFITAS</span>&nbsp;es un bebé precioso que fue rescatado junto a su mamá, su abuela y sus<strong>&nbsp;¡11 hermanos!</strong></p><p class=\"ql-align-center\">&nbsp;</p><p>La mayoría de sus hermanitos ya han encontrado un hogar, sin embargo,&nbsp;<span style=\"background-color: rgb(255, 229, 153);\">GAFITAS</span>&nbsp;<strong>sigue esperando que alguien se enamore de Él</strong>&nbsp;y quiera hacerlo parte de su familia.</p><p><br></p><p><span style=\"background-color: rgb(255, 229, 153);\">GAFITAS</span>&nbsp;es&nbsp;<strong>&nbsp;sociable, cariñoso y bueno</strong>, travieso a ratos como buen bebé, además de guapísimo, por eso no entendemos que nadie se haya fijado aún en él.</p>', 'Mix', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mascotas_acogidas_adoptadas`
--

CREATE TABLE `mascotas_acogidas_adoptadas` (
  `id` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `id_mascota` int(11) NOT NULL,
  `fecha_acogida` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `estado` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `mascotas_acogidas_adoptadas`
--

INSERT INTO `mascotas_acogidas_adoptadas` (`id`, `id_usuario`, `id_mascota`, `fecha_acogida`, `estado`) VALUES
(9, 19, 90, '2019-06-18 20:30:42', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `preferencias`
--

CREATE TABLE `preferencias` (
  `id` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `id_caracteristica` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `preferencias`
--

INSERT INTO `preferencias` (`id`, `id_usuario`, `id_caracteristica`) VALUES
(53, 19, 25),
(54, 19, 27),
(55, 19, 30),
(56, 15, 24),
(57, 15, 26);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `provincias`
--

CREATE TABLE `provincias` (
  `id_provincia` int(2) NOT NULL,
  `provincia` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `provincias`
--

INSERT INTO `provincias` (`id_provincia`, `provincia`) VALUES
(1, 'Álava'),
(2, 'Albacete'),
(3, 'Alicante'),
(4, 'Almería'),
(5, 'Ávila'),
(6, 'Badajoz'),
(7, 'Baleares (Illes)'),
(8, 'Barcelona'),
(9, 'Burgos'),
(10, 'Cáceres'),
(11, 'Cádiz'),
(12, 'Castellón'),
(13, 'Ciudad Real'),
(14, 'Córdoba'),
(15, 'A Coruña'),
(16, 'Cuenca'),
(17, 'Girona'),
(18, 'Granada'),
(19, 'Guadalajara'),
(20, 'Guipúzcoa'),
(21, 'Huelva'),
(22, 'Huesca'),
(23, 'Jaén'),
(24, 'León'),
(25, 'Lleida'),
(26, 'La Rioja'),
(27, 'Lugo'),
(28, 'Madrid'),
(29, 'Málaga'),
(30, 'Murcia'),
(31, 'Navarra'),
(32, 'Ourense'),
(33, 'Asturias'),
(34, 'Palencia'),
(35, 'Las Palmas'),
(36, 'Pontevedra'),
(37, 'Salamanca'),
(38, 'Santa Cruz de Tenerife'),
(39, 'Cantabria'),
(40, 'Segovia'),
(41, 'Sevilla'),
(42, 'Soria'),
(43, 'Tarragona'),
(44, 'Teruel'),
(45, 'Toledo'),
(46, 'Valencia'),
(47, 'Valladolid'),
(48, 'Vizcaya'),
(49, 'Zamora'),
(50, 'Zaragoza'),
(51, 'Ceuta'),
(52, 'Melilla');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipos_mascota`
--

CREATE TABLE `tipos_mascota` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tipos_mascota`
--

INSERT INTO `tipos_mascota` (`id`, `nombre`) VALUES
(1, 'Perro'),
(2, 'Gato'),
(3, 'Otro');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipos_usuario`
--

CREATE TABLE `tipos_usuario` (
  `id` int(11) NOT NULL,
  `nombre_tipo` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tipos_usuario`
--

INSERT INTO `tipos_usuario` (`id`, `nombre_tipo`) VALUES
(1, 'admin'),
(2, 'user');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipos_vivienda`
--

CREATE TABLE `tipos_vivienda` (
  `id_vivienda` int(11) NOT NULL,
  `nombre_vivienda` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tipos_vivienda`
--

INSERT INTO `tipos_vivienda` (`id_vivienda`, `nombre_vivienda`) VALUES
(1, 'Vivienda Aislada'),
(2, 'Vivienda Pareada'),
(3, 'Vivienda Adosada'),
(4, 'Apartamento'),
(5, 'Estudio'),
(6, 'Dúplex'),
(7, 'Ático'),
(8, 'Piso'),
(9, 'Bajo con jardín');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id_usuario` int(11) NOT NULL,
  `dni` varchar(9) NOT NULL,
  `email` varchar(254) NOT NULL,
  `password` varchar(255) NOT NULL,
  `nombre` varchar(150) NOT NULL,
  `apellidos` varchar(200) NOT NULL,
  `telefono` int(9) DEFAULT NULL,
  `direccion` varchar(500) NOT NULL,
  `fecha_nacimiento` int(11) NOT NULL,
  `id_tipo_usuario` int(11) NOT NULL,
  `id_provincia` int(2) NOT NULL,
  `direccion2` varchar(255) NOT NULL,
  `id_tipo_vivienda` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id_usuario`, `dni`, `email`, `password`, `nombre`, `apellidos`, `telefono`, `direccion`, `fecha_nacimiento`, `id_tipo_usuario`, `id_provincia`, `direccion2`, `id_tipo_vivienda`) VALUES
(15, '45945472M', 'protectora.zeus@gmail.com', '$2b$10$RmrlN1YDwyGoMvQq.Bc6xuqiXBk5tCEgEFMEmXAd3GS61YtsueO0S', 'Administrador', 'Admin', 644829981, 'Calle Luis Eduardo Aguirre', 708645600, 1, 14, '10-A 3ºB', 8),
(19, '45745825L', 'usuario_normal@gmail.com', '$2b$10$tOnsAbPUy2R3X7EtQ0GGouIrjmD.hCF6cke.UTS7b81LxImjz/qaO', 'Usuario', 'Normal', 654987321, 'Calle Oleiros nº 4', 1559772000, 2, 14, '14011 Córdoba', 5);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `caracteristicas`
--
ALTER TABLE `caracteristicas`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `caracteristicas_mascota`
--
ALTER TABLE `caracteristicas_mascota`
  ADD PRIMARY KEY (`id`),
  ADD KEY `caracteristicas_mascota_fk1` (`id_caracteristica`),
  ADD KEY `caracteristicas_mascota_fk2` (`id_mascota`);

--
-- Indices de la tabla `estados_mascota`
--
ALTER TABLE `estados_mascota`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `mascotas`
--
ALTER TABLE `mascotas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mascotas_fk1` (`id_estado`),
  ADD KEY `mascotas_fk2` (`id_tipo`);

--
-- Indices de la tabla `mascotas_acogidas_adoptadas`
--
ALTER TABLE `mascotas_acogidas_adoptadas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mascotas_acogidas_fk1` (`id_mascota`),
  ADD KEY `mascotas_acogidas_fk2` (`id_usuario`);

--
-- Indices de la tabla `preferencias`
--
ALTER TABLE `preferencias`
  ADD PRIMARY KEY (`id`),
  ADD KEY `preferencias_fk1` (`id_caracteristica`),
  ADD KEY `preferencias_fk2` (`id_usuario`);

--
-- Indices de la tabla `provincias`
--
ALTER TABLE `provincias`
  ADD PRIMARY KEY (`id_provincia`);

--
-- Indices de la tabla `tipos_mascota`
--
ALTER TABLE `tipos_mascota`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tipos_usuario`
--
ALTER TABLE `tipos_usuario`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tipos_vivienda`
--
ALTER TABLE `tipos_vivienda`
  ADD PRIMARY KEY (`id_vivienda`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id_usuario`),
  ADD KEY `usuario_fk1` (`id_tipo_usuario`),
  ADD KEY `usuario_fk2` (`id_provincia`),
  ADD KEY `usuario_fk3` (`id_tipo_vivienda`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `caracteristicas`
--
ALTER TABLE `caracteristicas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT de la tabla `caracteristicas_mascota`
--
ALTER TABLE `caracteristicas_mascota`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=122;

--
-- AUTO_INCREMENT de la tabla `estados_mascota`
--
ALTER TABLE `estados_mascota`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `mascotas`
--
ALTER TABLE `mascotas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=91;

--
-- AUTO_INCREMENT de la tabla `mascotas_acogidas_adoptadas`
--
ALTER TABLE `mascotas_acogidas_adoptadas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `preferencias`
--
ALTER TABLE `preferencias`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=58;

--
-- AUTO_INCREMENT de la tabla `provincias`
--
ALTER TABLE `provincias`
  MODIFY `id_provincia` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- AUTO_INCREMENT de la tabla `tipos_mascota`
--
ALTER TABLE `tipos_mascota`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `tipos_usuario`
--
ALTER TABLE `tipos_usuario`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `tipos_vivienda`
--
ALTER TABLE `tipos_vivienda`
  MODIFY `id_vivienda` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `caracteristicas_mascota`
--
ALTER TABLE `caracteristicas_mascota`
  ADD CONSTRAINT `caracteristicas_mascota_fk1` FOREIGN KEY (`id_caracteristica`) REFERENCES `caracteristicas` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `caracteristicas_mascota_fk2` FOREIGN KEY (`id_mascota`) REFERENCES `mascotas` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `mascotas`
--
ALTER TABLE `mascotas`
  ADD CONSTRAINT `mascotas_fk1` FOREIGN KEY (`id_estado`) REFERENCES `estados_mascota` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `mascotas_fk2` FOREIGN KEY (`id_tipo`) REFERENCES `tipos_mascota` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `mascotas_acogidas_adoptadas`
--
ALTER TABLE `mascotas_acogidas_adoptadas`
  ADD CONSTRAINT `mascotas_acogidas_fk1` FOREIGN KEY (`id_mascota`) REFERENCES `mascotas` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `mascotas_acogidas_fk2` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `preferencias`
--
ALTER TABLE `preferencias`
  ADD CONSTRAINT `preferencias_fk1` FOREIGN KEY (`id_caracteristica`) REFERENCES `caracteristicas` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `preferencias_fk2` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD CONSTRAINT `usuario_fk1` FOREIGN KEY (`id_tipo_usuario`) REFERENCES `tipos_usuario` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `usuario_fk2` FOREIGN KEY (`id_provincia`) REFERENCES `provincias` (`id_provincia`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `usuario_fk3` FOREIGN KEY (`id_tipo_vivienda`) REFERENCES `tipos_vivienda` (`id_vivienda`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
