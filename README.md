# BlogThisTrack!

Sabendo das possibilidades da linguagem AppleScript, como por exemplo, controlar o iTunes e outros programas através da linha de comando, decidi colocar na sidebar do meu blog uma área com a capa do disco que eu estou escutando no iTunes. O **BlogThisTrack!** faz isso em conjunto com o Dropbox e é bem simples.

## Uso
* Você vai precisar do Dropbox;
* E do iTunes (a princípio é necessário estar no Mac OS X para executar o script).

A ideia é a seguinte: utilizar um link público do dropbox para disponibilizar uma imagem (a capa do album) no seu site/blog. O AppleScript vai servir para recuperar a capa do Album da música que está sendo tocada no iTunes e colocá-la em um pasta pública do Dropbox; o Dropbox, por sua vez, fornece um link público que será colocado no site. Mas como manter o mesmo link se a imagem é atualizada sempre que uma novo Album estiver tocando? Simples: o link (url) aponta para um link simbólico na pasta pública do Dropbox! Nada como uma bela gambiarra 🙂

O código AppleScript utilizado para recuperar a capa do Album que está tocando no iTunes e copiar para a pasta pública no Dropbox, segue mais abaixo e você deve colocá-lo em:

```
/Users/$USER/Library/iTunes/Scripts
```

Se esta pasta não existir, basta criá-la:

```
$ mkdir -p /Users/$USER/Library/iTunes/Scripts
```

Feito isto, copie o ApplScript "BlogThisTrack" (download mais abaixo) para a pasta:

```
$ cp BlogThisTrack.scpt /Users/$USER/Library/iTunes/Scripts
```

Para fazer tudo funcionar, execute uma vez o AppleScript e, na pasta BlogThisTrack (dentro da pasta pública do Dropbox), crie um link simbólico da imagem do Album recuperada com um nome qualquer, por exemplo:

```
$ cd $USER/Dropbox/Public/BlogThisTrack
$ ln -s iTunes.png albumart.png
```

Observe que o link "albumart.png" será atualizado sempre que o script AppleScript for executado.

![Exemplo dos arquivos que ficam dentro da pasta BlogThisTrack, dentro da pasta pública do Dropbpox. Observe que o arquivo albumart.png é um link simbólico para o arquivo de imagem iTunes.png.](http://craftmind.files.wordpress.com/2012/11/screen-shot-2012-11-13-at-7-18-01-pm.png)

Agora uma parte importante, o link: quando se coloca arquivos dentro da pasta Public do Dropbox, é possível obter um link público para qualquer arquivo. Para fazer isto, pelo Finder, dê um clique de "dois dedos" (clique sobre o arquivo utilizando dois dedos, assim você terá acesso ao menu de contexto do Finder) sobre o arquivo, aponte para o menu do Dropbox e selecione a opção "Copy Public Link":

![Obtendo o link público que será usado para linkar a imagem no seu site/blog.](http://craftmind.files.wordpress.com/2012/11/screen-shot-2012-11-13-at-8-09-44-pm.png)

Feito isto, no site, escolha algum lugar (como uma barra lateral) em que será colocada a capa do Album. Na área escolhida, coloque o código:

```
<img src="https://link.que.o.dropbox.criou/albumart.png" />
```

Sinta-se livre para incrementar, adicionando uma borda ou mesmo limitando o tamanho da imagem - assim todas as capas poderão ter o mesmo tamanho 😉

Se você estiver no wordpress, e caso você não tenha acesso ao código-fonte do seu site/blog, a melhor forma de fazer a inserção desse código - e é aí que a coisa fica esperta!, é usar a widget de texto.

![Insira uma widget de texto na área que você quiser e insira o código acima.](http://craftmind.files.wordpress.com/2012/11/screen-shot-2012-11-13-at-7-14-16-pm.png)

Insira uma widget de texto na área que você quiser e insira o código acima.

Agora, sempre que você quiser mostrar que Album está escutando no iTunes, basta executar o AppleScript que a capa do Album será atualizada no seu site/blog!

![Executando o AppleScript BlogThisTrack dentro do iTunes.](http://craftmind.files.wordpress.com/2012/11/screen-shot-2012-11-13-at-7-08-29-pm.png)

E e resultado (no seu site/blog):

![Capa do Album no site/blog.](http://craftmind.files.wordpress.com/2012/11/screen-shot-2012-11-13-at-7-13-39-pm.png)


##Download

Última versão (master): [BlogThisTrack!](https://github.com/cfbastarz/blogthistrack/blob/master/BlogThisTrack.applescript)

##Dicas

* Como o "BlogThisTrack" utiliza o iTunes, tire proveito disso: utilize-o para manter as capas dos seus Albuns atualizadas, assim não correrá o risco de não ter nenhuma imagem para mostrar;
* Há outros AppleScripts que podem ser utilizados para ajudar a manter a sua biblioteca de músicas organizada e atualizada, veja [aqui](http://dougscripts.com/itunes/).

##Observações

* Este método depende do Dropbox. Para que a atualização das capas do Album no seu site/blog funcione, é necessário que o Dropbox esteja funcionando.

##Referências

* [http://www.macosxtips.co.uk/geeklets/collections/itunes-seperate-info-mail-infos-/](href="http://www.macosxtips.co.uk/geeklets/collections/itunes-seperate-info-mail-infos-/)

