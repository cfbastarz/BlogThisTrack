--BlogThisTrack - script para recuperar a capa de um Album tocando no iTunes e escrever em um arquivo
--AppleScript original em http://www.macosxtips.co.uk/geeklets/collections/itunes-seperate-info-mail-infos-/
--Créditos para http://www.macosxtips.co.uk (usuário http://www.macosxtips.co.uk/geeklets/user/profile/csoul/) e craftmind.wordpress.com (usuário http://craftmind.wordpress.com/about/)
--Linguagem: AppleScript (compilador v.2.2.3)
--Data: 13/11/2012

--A variável "myPath" define onde se encontra a pasta "BlogThisTrack" (para o script funcionar, ela deve ser criada manualmete):
set myPath to ((path to home folder) as text) & "Dropbox:Public:BlogThisTrack:"
--A variável "artworkItunes" define o caminho absoluto para o arquivo "iTunes.png" que será escrito ao final do script:
set artworkItunes to POSIX path of myPath & "iTunes.png"
--A variável "defaultPic" define um arquivo intermediário
set defaultPic to POSIX path of myPath & "default.png"

if running of application "iTunes" then
	--Na estrutura abaixo, literalmente é dito ao programa iTunes executar as seguintes ações:
	tell application "iTunes"
		--Define-se a variável "artData" para receber a informação da capa do Album da música que está sendo executada no iTunes:
		set artData to data of artwork 1 of current track
		--Define-se a variável "fileRef" que irá abrir atrituir à variável "artworkiTunes" (que aponta para o arquivo alvo iTunes.png) a informação da capa do Album:
		set fileRef to (open for access artworkItunes with write permission)
		--Utiliza-se o método try:
		--Caso o iTunes esteja tocando alguma música e esta possui uma capa de Album definida, a informação da capa do Album será escrita na variável : fileRef":
		try
			write artData to fileRef starting at 0
			close access fileRef
			--Caso alguma música não esteja tocando ou se não houver capa de Album disponível, uma mensagem de erro padrão será mostrada:
		on error errorMsg
			--Novamente usa-se o método try, agora para fechar o arquivo iTunes.png:
			try
				close access fileRef
			end try
			--Caso algum erro de escrita ocorra (devida a um disco cheio, por exemplo):
			error errorMsg
		end try
	end tell
else
	--Utiliza-se o programa Image Events (pode-se utilizá-lo em outros scripts para a manipulação de imagens):
	tell application "Image Events"
		set defaultData to open defaultPic
		--Salva o arquivo final na variável principal "artworkiTunes":
		save defaultData as PNG in artworkItunes with replace
		--Fecha o arquivo final:
		close defaultData
	end tell
end if