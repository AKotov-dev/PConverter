??    -      ?  =   ?      ?  G   ?  q   )     ?  g   ?  ?     T   ?  ?   :     ?     ?     ?  ?  ?  l   ?  ?   ?  ?   ?	     ?
     ?
     ?
  4  ?
  ?   ?  ?   j  ?   ?  ?   ?  L  B     ?     ?     ?  $   ?  "     #   /     S  $   l  ;   ?  ^  ?     ,  #   J  ?   n  /   ?  S  !  ?  u       c   *  ?  ?  ?   8  !   ?      m      ?   ?     `  ?   q  ?  -  ?   ?    ?  !   ?  @   ?  
      `     ?   y"  K  <#  ?   ?$  
   r%     }%  
   ?%  ?  ?%  ?   @(  ?   )  ?   *    ?*  ?  ,  $   ?.  !   ?.  %   ?.  +   /  )   </  *   f/     ?/     ?/  ;   ?/  ?   0     ?1     2  ?   %2  ;   ?2  ?  3  ?  5     ?7  ?   ?7    ?8  ?   ?;     ?<           ,           '          *   	   "                       #                                  (   )   !                           %                 &             $   -                          +            
    * File and Folder path should not contain spaces or any Characteristics 1. Select the package to convert
2. Select the directory for the final package
3. Select your final package type
 Add Automatically install each generated package, and remove the package file
after it has been installed.
 Be less strict about which patch file is used, perhaps attempting to use a patch file
for an older verson of the package. This is not guaranteed to always work; older
patches may not necessarily work with newer packages.
 Be verbose: Display each command alien runs in the process
of converting a package.
 By default, alien adds one to the minor version number of each package
it converts. If this option is given, alien will not do this.
 Conversion... Do not use any patch files. Folder Generate a temporary directory suitable for building a package from, but do not
 actually create the package. This is useful if you want to move files around in the
 package before building it. The package can be built from this temporary directory by
 running "debian/rules binary", if you were creating a Debian package, or by running
 "rpmbuild -bb <packagename>.spec" if you were creating a Red Hat package.
 Instead of incrementing the version number of the converted package
by 1, increment it by the given number.
 License: GPLv3
Author: alex_q_2000 (C) 2021
Compilation: Lazarus 2.0.10
Gratitudes: foxoman

Russian Linux Forum: https://linuxforum.ru

The idea of the GUI was borrowed from
the project "Package Converter", which
was developed by "foxoman" 04.07.2009
 Like -g, but do not generate the packagename.orig directory. This is only useful when
you are very low on disk space and are generating a debian package.
 OPTIONS Package Type Quit Sanitize all file owners and permissions when building a deb. This may be useful if
the original package is a mess. On the other hand, it may break some things to mess
with their permissions and owners to the degree this does, so it defaults to off. This
can only be used when converting to debian packages.
 Specifiy a description for the package. This only has an effect when converting
from the tgz package format, which lacks descriptions.
 Specifiy a version for the package. This only has an effect when converting
from the tgz package format, which may lack version information.
 Specify the patch to be used instead of automatically looking the patch up in
/var/lib/alien. This has no effect unless a debian package is being built.
 Test the generated packages. Currently this is only supported for debian packages,
which, if lintian is installed, will be tested with lintian and lintian's output displayed.
 Try to convert the scripts that are meant to be run when the package is installed
and removed. Use this with caution, becuase these scripts might be designed to
work on a system unlike your own, and could cause problems. It is recommended
that you examine the scripts by hand and check to see what they do before using this option.
 [ Generate a Debian package ] [ Generate a LSB package ] [ Generate a Red Hat package ] [ Generate a SlackWare tgz package ] [ Generate a Solaris pkg package ] [ Generate a Stampede slp package ] taboutform.captionAbout tmainform.convertbtn.captionConvert tmainform.label1.caption[ Select your final package type ] tmainform.label2.captionAlien supports conversion between Linux Standard Base (LSB), LSB-compliant .rpm packages, .deb, Stampede (.slp), Solaris (.pkg) and Slackware (.tgz, .txz, .tbz, .tlz) packages. It is also capable of automatically installing the generated packages, and can try to convert the installation scripts included in the archive well. tmainform.label4.captionIdle tmainform.toolbutton9.captionAbout unit1.sdebian2For converting to (but not from) deb format, the gcc, make, debmake, dpkg-dev, and dpkg packages must be installed. unit1.sfinal[ Select your final package type ] unit1.sfinal2alien supports conversion between Linux Standard Base (LSB), LSB-compliant .rpm packages, .deb, Stampede (.slp), Solaris (.pkg) and Slackware (.tgz, .txz, .tbz, .tlz) packages. It is also capable of automatically installing the generated packages, and can try to convert the installation scripts included in the archive well. unit1.slsb2Unlike the other package formats, alien can handle the depenendencies of lsb packages if the destination package format supports dependencies. Note that this means that the package generated from a lsb package will depend on a package named "lsb" -- your distribution should provide a package by that name, if it is lsb compliant. The scripts in the lsb package will be converted by default as well. unit1.sprogressidleIdle unit1.sredhat2For converting to and from rpm format the Red Hat Package Manager must be installed. unit1.sslackware2Note that when converting from the tgz format, alien will simply generate an output package that has the same files in it as are in the tgz file. This only works well if the tgz file has precompiled binaries in it in a standard linux directory tree. Do NOT run alien on tar files with source code in them, unless you want this source code to be installed in your root directory when you install the package! unit1.ssolaris2To manipulate packages in the Solaris pkg format (which is really the SV datastream package format, you will need the Solaris pkginfo and pkgtrans tools. unit1.sstampede2Make slp package Content-Type: text/plain; charset=UTF-8
Plural-Forms: nplurals=2; plural=(n != 1);
Project-Id-Version: Package Converter
PO-Revision-Date: 
Last-Translator: 
Language-Team: alex_q_2000 (C) 2021
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Language: ru
X-Generator: Poedit 2.4.2
 * Путь не должен содержать пробелов или других Особенностей 1. Выберите пакет для конвертирования
2. Выберите каталог для конечного пакета
3. Выберите тип для конечного пакета
 Добавить Автоматически устанавливает каждый сгенерированный пакет и удаляет
файл пакета после его установки.
 Быть менее строгим в отношении того, какой файл патча используется, возможно, пытаясь
использовать файл патча для более старой версии пакета. Это не гарантирует, что всегда будет
работать; старые патчи могут и не работать с новыми пакетами.
 Подробный лог: Показать каждую команду, выполняемую alien
в процессе преобразования пакета.
 По умолчанию alien добавляет единицу к младшему номеру версии каждого пакета,
который он преобразует. Если этот вариант будет задан, alien этого делать не будет.
 Конвертирование... Не использовать файлы исправлений. Папка Создать временный каталог, подходящий для создания пакета, но
на самом деле не создавать его. Это полезно, если вы хотите переместить файлы в
пакете перед его сборкой. Пакет можно создать из этого временного каталога,
запустив "debian/rules binary", если вы создавали пакет Debian, или запустив
"rpmbuild-bb <имя пакета>.spec", если вы создавали пакет Red Hat.
 Вместо того чтобы увеличивать номер версии преобразованного пакета
на 1, увеличьте его на заданное число.
 Лицензия: GPLv3
Автор: alex_q_2000 (C) 2021
Компиляция: Lazarus 2.0.10
Благодарности: foxoman

Russian Linux Forum: https://linuxforum.ru

Идея GUI была позаимствована из
проекта "Package Converter", который
был разработан "foxoman" 04.07.2009
 Как-g, но не генерирует каталог packagename.orig. Это полезно только тогда,
когда у вас очень мало места на диске и вы создаете пакет debian.
 ОПЦИИ Тип Пакета Выход Очистка всех владельцев и разрешений файлов при создании deb. Это может быть полезно, если
оригинальная упаковка находится в беспорядке. С другой стороны, он может сломать некоторые
вещи, чтобы возиться с их разрешениями и владельцами в той степени, в какой это происходит,
поэтому по умолчанию он выключен. Это можно использовать только при преобразовании в
пакеты debian.
 Укажите описание пакета. Это работает только при преобразовании
из формата пакета tgz, в котором отсутствуют описания.
 Укажите версию пакета. Это работает только при преобразовании
из формата пакета tgz, в котором может отсутствовать информация о версии.
 Укажите патч, который будет использоваться вместо автоматического поиска
патча в файле /var/lib/alien. Работает только с пакетами debian.
 Тест сгенерированных пакетов. В настоящее время это поддерживается только для
пакетов debian, которые, будут протестированы с отображением вывода lintian.
 Попытаться преобразовать сценарии, которые должны запускаться при установке
и удалении пакета. Используйте это с осторожностью, потому что эти сценарии могут быть
разработаны для работы в системе, отличной от вашей собственной, и могут вызвать проблемы.
Рекомендуется изучить сценарии вручную и проверить, что они делают, прежде чем использовать
эту опцию.
 [ Создать пакет Debian ] [ Создать пакет LSB ] [ Создать пакет Red Hat ] [ Создать пакет SlackWare tgz ] [ Создать пакет Solaris pkg ] [ Создать пакет Stampede slp ] О программе Конвертировать [ Выберите тип конечного пакета ] Alien поддерживает преобразование между пакетами Linux Standard Base (LSB), LSB-совместимыми пакетами .rpm, .deb, Stampede (.slp), Solaris (.pkg) и Slackware (.tgz, .txz, .tbz, .tlz). Он также способен автоматически устанавливать сгенерированные пакеты и может попытаться преобразовать сценарии установки, включенные в архив. Ожидание О программе Для преобразования в формат deb (но не из него) необходимо установить пакеты gcc, make, debmake, dpkg-dev и dpkg. [ Выберите тип конечного пакета ] alien поддерживает преобразование между пакетами Linux Standard Base (LSB), LSB-совместимыми пакетами .rpm, .deb, Stampede (.slp), Solaris (.pkg) и Slackware (.tgz, .txz, .tbz, .tlz). Он также способен автоматически устанавливать сгенерированные пакеты и может попытаться преобразовать сценарии установки, включенные в архив. В отличие от других форматов пакетов, alien может обрабатывать зависимости пакетов lsb, если формат целевого пакета поддерживает зависимости. Обратите внимание, что это означает, что пакет, сгенерированный из пакета lsb, будет зависеть от пакета с именем "lsb" - ваш дистрибутив должен предоставить пакет с таким именем, если он совместим с lsb. Скрипты в пакете lsb также будут преобразованы по умолчанию. Ожидание Для преобразования в формат rpm и обратно должен быть установлен менеджер пакетов Red Hat. Обратите внимание, что при преобразовании из формата tgz alien просто сгенерирует выходной пакет, содержащий те же файлы, что и в файле tgz. Это хорошо работает только в том случае, если файл tgz содержит предварительно скомпилированные двоичные файлы в стандартном дереве каталогов linux. Не запускайте tar файлы с исходным кодом в них, если вы не хотите, чтобы этот исходный код был установлен в вашем корневом каталоге при установке пакета! Для работы с пакетами в формате Solaris pkg (который на самом деле является форматом пакета SV data stream) вам понадобятся инструменты Solaris pkginfo и pkgtrans. Сделать slp пакет 