--BlogThisTrack - script para recuperar a capa de um Album tocando no iTunes e escrever em um arquivo
--AppleScript original em http://www.macosxtips.co.uk/geeklets/collections/itunes-seperate-info-mail-infos-/
--Cr�ditos para http://www.macosxtips.co.uk (usu�rio http://www.macosxtips.co.uk/geeklets/user/profile/csoul/) e craftmind.wordpress.com (usu�rio http://craftmind.wordpress.com/about/)
--Linguagem: AppleScript (compilador v.2.2.3)
--Data: 13/11/2012

--A vari�vel "myPath" define onde se encontra a pasta "BlogThisTrack" (para o script funcionar, ela deve ser criada manualmete):
set myPath to ((path to home folder) as text) & "Dropbox:Public:BlogThisTrack:"
--A vari�vel "artworkItunes" define o caminho absoluto para o arquivo "iTunes.png" que ser� escrito ao final do script:
set artworkItunes to POSIX path of myPath & "iTunes.png"
--A vari�vel "defaultPic" define um arquivo intermedi�rio
set defaultPic to POSIX path of myPath & "default.png"

if running of application "iTunes" then
	--Na estrutura abaixo, literalmente � dito ao programa iTunes executar as seguintes a��es:
	tell application "iTunes"
		--Define-se a vari�vel "artData" para receber a informa��o da capa do Album da m�sica que est� sendo executada no iTunes:
		set artData to data of artwork 1 of current track
		--Define-se a vari�vel "fileRef" que ir� abrir atrituir � vari�vel "artworkiTunes" (que aponta para o arquivo alvo iTunes.png) a informa��o da capa do Album:
		set fileRef to (open for access artworkItunes with write permission)
		--Utiliza-se o m�todo try:
		--Caso o iTunes esteja tocando alguma m�sica e esta possui uma capa de Album definida, a informa��o da capa do Album ser� escrita na vari�vel : fileRef":
		try
			write artData to fileRef starting at 0
			close access fileRef
			--Caso alguma m�sica n�o esteja tocando ou se n�o houver capa de Album dispon�vel, uma mensagem de erro padr�o ser� mostrada:
		on error errorMsg
			--Novamente usa-se o m�todo try, agora para fechar o arquivo iTunes.png:
			try
				close access fileRef
			end try
			--Caso algum erro de escrita ocorra (devida a um disco cheio, por exemplo):
			error errorMsg
		end try
	end tell
else
	--Utiliza-se o programa Image Events (pode-se utiliz�-lo em outros scripts para a manipula��o de imagens):
	tell application "Image Events"
		set defaultData to open defaultPic
		--Salva o arquivo final na vari�vel principal "artworkiTunes":
		save defaultData as PNG in artworkItunes with replace
		--Fecha o arquivo final:
		close defaultData
	end tell
end if