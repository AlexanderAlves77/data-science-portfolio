# Função para obter tudo que estiver nas tags td e div e com seletor CSS spaceit_pad
# Assim extraímos informações gerais da página
def getInfoGeral(soup):
    information = soup.select("td div .spaceit_pad")
    side_info_par = []
    for info in information:
        side_info_par.append(info.text.split())
    return side_info_par
	
	
# Função para obter o número de pessoas que adicionaram o anime aos favoritos
def getFavorite(information):
    for info in information:
        if info[0] == "Favorities:":
            data = info[1].split(",")
            return int("".join(data))
    return None 
	
	
# Função para obter o número do episódio
def episodeNumberParser(information):
    for info in information:
        if(info[0] == "Episodes:"):
            if info[1] != "Unknown":
                return int(info[1])
            return None 
    return None
	
	
# Função para obter o tipo de anime TV
def typeParser(information):
    for info in information:
        if (info[0] == "Type:"):
            return info[1]
    return None 
	
	
# Função para obter o dia em que o anime estreou
def dayPremiered(information):
    for info in information:
        if (info[0] == "Premiered:"):
            premiered_day = ""
            return " ".join(info[1:])
    return None
	
	
# Função para obter a fonte de onde do anime
def getSource(information):
    for info in information:
        if (info[0] == "Source:"):
            return " ".join(info[1:])
    return None
	
	
# Função para retornar uma lista de gêneros do anime
def getGenres(information):
    for info in information:
        if (info[0] == "Genres:"):
            genres = "".join(info[1:])
            return genres.split(",")
    return None
	
	
# Função que retorna uma lista de estúdios que estão patrocinando este anime
def getStudios(information):
    for info in information:
        if (info[0] == "Studios:"):
            return " ".join(info[1:])
    return None
	
	
# Função que retorna uma lista de empresas que realmente possuem a licença deste anime
def getLicense(information):
    for info in information:
        if (info[0] == "Licensors:"):
            if (info[1] == "None:"):
                return None 
            license = "".join(info[1:])
            return license.split(",")
    return None
	
	
# Função que obtém a classificação do filme 
def getRating(information):
    for info in information:
        if (info[0] == "Rating:"):
            return "".join(info[1:4])
    return None
	
	
# Função para obter o nome de empresas que estão financiando o anime (Producers)
def producers_names(soup):
    div_and_a = soup.find_all(["div","a"], class_=["spaceit_pad"])
    for index, j in enumerate(div_and_a):
        if div_and_a[index].text.split("\n")[1] == "Producers:":
            res = re.sub(" *","", div_and_a[index].text)
            new_res = res.split("\n")
            for i, j in enumerate(new_res):
                if j == "Producers:":
                    return new_res[i+1].split(",")
                    break
    return None 
	
	
# Função para obter informações de ranking
def getRanking(soup):
    ranking = soup.select_one(".ranked strong").text
    data = ranking.split("#")[1]
    return int(data)
	
	
# Função para obter o score do Anime
def getScore(soup):
    data = float(soup.select_one(".score-label").text)
    return data 
	
	
# Função para obter informação de popularidade
def getPopularity(soup):
    popularity = soup.select_one(".popularity strong").text
    data = popularity.split("#")[1]
    return int(data)
	

# Função para obter informação sobre os membros
def getMembers(soup):
    members = soup.select_one(".members strong").text
    data = members.split(",")
    return int("".join(data))
	
	
# Função para obter o número de pessoas que votaram no anime
def votersCount(soup):
    count = soup.select(".js-statistics-info span")
    data = []
    for i in count:
        data.append(i.text)
    if len(data) > 3:
        return int(data[2])
    return None
	
	
# Função para obter a voz do ator que faz a narração
def voiceActorsName(soup):
    actorNames = []
    names = soup.select(".js-anime-character-va-lang .spaceit_pad a")
    for name in names:
        data = "".join(name.text.split())
        actorNames.append(data)
    return actorNames
	
	
# Função para obter o idioma do ator que faz a narração
def voiceActorsLanguage(soup):
    languages = []
    langNames = soup.select(".js-anime-character-va-lang .spaceit_pad a")
    for language in langNames:
        lang = "".join(language.text.split())
        languages.append(lang)
    return languages
	
	
# Função que usa o voiceActorName e voiceActorsLanguage para criar um dataframe 
# que irá anexar todas as informações relacionadas às vozes dos atores.
# Usando essas informações, dividiremos os voiceActors com base em seus idiomas.
def voiceActorsNamedandLanguage(soup):
    names = voiceActorsName(soup)
    languages = voiceActorsLanguage(soup)
    nameAndLang = []
    for i in range(len(names)):
        nameAndLang.append([names[i], languages[i]])
    return nameAndLang
	
	
# Função que retorna a ocupação de cada funcionário
def staffOccupation(soup):
    data = []
    for i in soup.select('td .js-scrollfix-bottom-rel .spaceit_pad small'):
        data.append("".join(i.text.split()))
    return data 
	
	
# Função que retorna o nome dos funcionários
def staffName(soup):
    data = []
    for i in soup.select('td .js-scrollfix-bottom-rel a'):
        data.append("".join(i.text.split()))
    uncleanData = []
    for index, info in enumerate(data):
        if info == "Addstaff":
            uncleanData.append(data[index+1:])
            break 
    cleanData = []
    for i in uncleanData:
        for j in i:
            if len(j) > 1:
                cleanData.append(j)
    return cleanData
	
	
# Função que concatena nome e ocupação dos funcionários
def staffNameandOccupation(soup):
    name = staffName(soup)
    occupation = staffOccupation(soup)
    nameAndOccupation = []
    for i in range(len(name)):
        nameAndOccupation.append([name[i], occupation[i]])
    return nameAndOccupation 
	
	
# Função que retorna o nome do Anime
def animeName(soup):
    name = soup.select_one('.title-name').text
    if len(name) > 1:
        return name
    return None 
	
	
def remove_quote(word):
    return word.replace("'","")
	
	
def remove_openBracket(word):
    return word.replace("[","")
	
	
def remove_closeBracket(word):
    return word.replace("]","")
	
	
def remove_commaWithSemicolon(word):
    return word.replace(",",";")
	
	
def remove_space(word):
    return word.replace(" ","")
	
	
	

for limit in range(0, 451, 50): 
    
    # Lista para os links
    links = []
    
    # URL
    url = f"https://myanimelist.net/topanime.php?limit={limit}"
    
    # Request
    rq = requests.get(url)
    print(rq.status_code)
    
    # Parse do html
    soup = bs(rq.text, "html.parser")
    
    # Seleção do que desejamos
    listsofA = soup.select(".hoverinfo_trigger a")
    
    # Loop para extrair o atributo href da tag a
    for a in listsofA:
        links.append(a.get("href"))
        
    # Abre o arquivo em disco
    file = open(f"dados/AnimeLinks/animeLinks{limit}.txt", "w")
    
    # Loop para salvar em disco
    for link in links:
        file.writelines(link+'\n')
        
    # Fecha o arquivo
    file.close()
    
    # Sleep
    time.sleep(10)
	
	
	
for limit in range(0, 451, 50):    
    # Lista
    animeInfo = []    
    # Leitura dos arquivos txt com os links
    with open(f"dados/AnimeLinks/animeLinks{limit}.txt", "r") as file:
        links = file.readlines()    
    print("Fazendo Web Scraping. Seja paciente e aguarde...")
    
    # Request para cada link
    for link in links:
        
        # Exemplo de url: https://myanimelist.net/anime/5114/Fullmetal_Alchemist__Brotherhood
        rq = requests.get(link)
        
        # Exemplo de url: https://myanimelist.net/anime/5114/Fullmetal_Alchemist__Brotherhood/characters
        rq2 = requests.get(link[:-2] + "/characters")
        
        # Soup com parse do html
        soup = bs(rq.text, "html.parser")
        soup2 = bs(rq2.text, "html.parser")
        
        # Obtém info geral da página
        information = getInfoGeral(soup)
        
        # Extrai os dados e salva na lista no formato de dicionário
        animeInfo.append(dict(
            name                      = animeName(soup),
            producers                 = producers_names(soup),
            ranking                   = getRanking(soup),
            votersCount               = votersCount(soup),
            score                     = getScore(soup),
            popularity                = getPopularity(soup),
            members                   = getMembers(soup),
            favorite                  = getFavorite(information),
            episodes                  = episodeNumberParser(information),
            animeType                 = typeParser(information),
            premiredDate              = dayPremiered(information),
            animeSource               = getSource(information),
            genres                    = getGenres(information),
            studios                   = getStudios(information),
            licenses                  = getLicense(information),
            rating                    = getRating(information),
            voiceActorNameandLanguage = voiceActorNameandLanguage(soup2),
            staffNameandOccupation    = staffNameandOccupation(soup2)))        
        # Sleep
        time.sleep(10)
    # Grava o resultado em disco
    with open(f"dados/AnimeInfo/animeInfo{limit}.txt", 'w') as fout:
        json.dump(animeInfo, fout)        
    # Sleep
    time.sleep(10)
	
	
	
for limit in range(0, 451, 50):    
    # Lista
    animeInfoName = []    
    # Abre os arquivos de links para leitura
    with open(f"dados/AnimeLinks/animeLinks{limit}.txt", "r") as file:
        links = file.readlines()    
    print("Extraindo os nomes dos animes. Seja paciente e aguarde...")    
    # Loop pelos links para extrair o nome dos animes
    for link in links:
        rq = requests.get(link)
        soup = bs(rq.text, "html.parser")
        animeInfoName.append(dict(name = animeName(soup)))
        time.sleep(5)
    # Salva o resultado em disco no formato json
    with open(f"dados/AnimeInfoNames/animeInfoNames{limit}.txt", 'w') as fout:
        json.dump(animeInfoName, fout)