# Passando por todos os dados e, em seguida, mudando seus gêneros
for index, genres in enumerate(newdf["genres"]):
    new_genre = ""
    if type(genres) != float:
        for genre in genres:
            if genre == "ActionAction":
                new_genre += "Action"
            elif genre == "AdventureAdventure":
                new_genre += "Adventure"
            elif genre == "ComedyComedy":
                new_genre += "Comedy"
            elif genre == "DramaDrama":
                new_genre += "Drama"
            elif genre == "FantasyFantasy":
                new_genre += "Fantasy"
            elif genre == "Sci-FiSci-Fi":
                new_genre += "Sci-fi"
            elif genre == "MysteryMystery":
                new_genre += "Mystery"
            elif genre == "SuspenseSuspense":
                new_genre += "Suspense"
            elif genre == "RomanceRomance":
                new_genre += "Romance"
            elif genre == "SliceofLifeSliceofLife":
                new_genre += "Sliceoflife"
            elif genre == "SupernaturalSupernatural":
                new_genre += "Supernatural"
            elif genre == "SportsSports":
                new_genre += "Sports"
            elif genre == "HorrorHorror":
                new_genre += "Horror"
            elif genre == "EcchiEcchi":
                new_genre += "Ecchi"
            elif genre == "AvantGardeAvantGarde":
                new_genre += "Avant_garde"
            elif genre == "BoysLoveBoysLove":
                new_genre += "Boys_love"
            elif genre == "GourmetGourmet":
                new_genre += "Gourmet"
            elif genre == "GirlsLoveGirlsLove":
                new_genre += "Girls_love"
            elif genre == "WorkLifeWorkLife":
                new_genre += "Work_life"
    newdf["genres"][index] = new_genre


# Atribuindo as informações do gênero alterado ao novo dataframe
for index, data in enumerate(newdf["voiceActorNameandLanguage"]):
    if type(data) != float:
        newdf["voiceActorNameandLanguage"][index] = newdf["voiceActorNameandLanguage"][index].replace("[[","[")
        newdf["voiceActorNameandLanguage"][index] = newdf["voiceActorNameandLanguage"][index].replace("]]","]")
		
	
# Remove aspas simples e [ de voiceActorNameandLanguage 
newdf["voiceActorNameandLanguage"] = remove_quote(newdf["voiceActorNameandLanguage"].str)
newdf["voiceActorNameandLanguage"] = remove_openBracket(newdf["voiceActorNameandLanguage"].str)


# Remove "], " e então [ e então faz o split dos dados com base em ; 
# Por fim, criar a lista de atores e sseus idiomas
for index, data in enumerate(newdf["voiceActorNameandLanguage"]):
    if type(data) != float:
        newdf["voiceActorNameandLanguage"][index] = re.sub(r"], ", ";", newdf["voiceActorNameandLanguage"][index])
        newdf["voiceActorNameandLanguage"][index] = remove_closeBracket(newdf["voiceActorNameandLanguage"][index])
        newdf["voiceActorNameandLanguage"][index] = newdf["voiceActorNameandLanguage"][index].split(";")
        for i, newData in enumerate(newdf["voiceActorNameandLanguage"][index]):
            newdf["voiceActorNameandLanguage"][index][i] = newdf["voiceActorNameandLanguage"][index][i].split(", ")
			
			
# Obtém os idiomas únicos usados em diferentes animes
# Encontramos idiomas únicos para que possam ser nossas colunas
unique_languages = []
for index, info in enumerate(newdf["voiceActorNameandLanguage"]):
    for data in newdf["voiceActorNameandLanguage"][index]:
        if len(data) > 1:
            if data[1] not in unique_languages:
                unique_languages.append(data[1])
				
				
# Criando um dataframe que irá dividir as vozes dos atores com base em seu idioma
for index, info in enumerate(newdf["voiceActorNameandLanguage"]):
    if len(info) > 1:
        Japanese = []
        Italian = []
        PortugueseBR = []
        German = []
        Hungarian = []
        English = []
        Korean = []
        Spanish = []
        French = []
        Mandarin = []
        Hebrew = []
        for data in newdf["voiceActorNameandLanguage"][index]:
            if data[1] == "Japanese":
                Japanese.append(data[0])
            elif data[1] == "Italian":
                Italian.append(data[0])
            elif data[1] == "Portuguese(BR)":
                PortugueseBR.append(data[0])
            elif data[1] == "German":
                German.append(data[0])
            elif data[1] == "Hungarian":
                Hungarian.append(data[0])
            elif data[1] == "English":
                English.append(data[0])
            elif data[1] == "Korean":
                Korean.append(data[0])
            elif data[1] == "Spanish":
                Spanish.append(data[0])
            elif data[1] == "French":
                French.append(data[0])
            elif data[1] == "Mandarin":
                Mandarin.append(data[0])
            elif data[1] == "Hebrew":
                Hebrew.append(data[0])
        new_dic["Japanese"].append(";".join(Japanese))
        new_dic["Italian"].append(";".join(Italian))
        new_dic["Portuguese(BR)"].append(";".join(PortugueseBR))
        new_dic["German"].append(";".join(German))
        new_dic["Hungarian"].append(";".join(Hungarian))
        new_dic["English"].append(";".join(English))
        new_dic["Korean"].append(";".join(Korean))
        new_dic["Spanish"].append(";".join(Spanish))
        new_dic["French"].append(";".join(French))
        new_dic["Mandarin"].append(";".join(Mandarin))
        new_dic["Hebrew"].append(";".join(Hebrew))
    else:
        new_dic["Japanese"].append(np.nan)
        new_dic["Italian"].append(np.nan)
        new_dic["Portuguese(BR)"].append(np.nan)
        new_dic["German"].append(np.nan)
        new_dic["Hungarian"].append(np.nan)
        new_dic["English"].append(np.nan)
        new_dic["Korean"].append(np.nan)
        new_dic["Spanish"].append(np.nan)
        new_dic["French"].append(np.nan)
        new_dic["Mandarin"].append(np.nan)
        new_dic["Hebrew"].append(np.nan)


# Limpeza dos dados
for index, data in enumerate(staffNnO["staffNameandOccupation"]):
    staffNnO["staffNameandOccupation"][index] = staffNnO["staffNameandOccupation"][index].replace("[[", "[")
    staffNnO["staffNameandOccupation"][index] = staffNnO["staffNameandOccupation"][index].replace("]]", "]")
    staffNnO["staffNameandOccupation"][index] = staffNnO["staffNameandOccupation"][index].replace("[\'", "")
    staffNnO["staffNameandOccupation"][index] = staffNnO["staffNameandOccupation"][index].replace("\'", "")
    staffNnO["staffNameandOccupation"][index] = staffNnO["staffNameandOccupation"][index].replace("], ", ";")
    staffNnO["staffNameandOccupation"][index] = staffNnO["staffNameandOccupation"][index].replace("]", "")


# Faz o split com base no índice
for index, data in enumerate(staffNnO["staffNameandOccupation"]):
    staffNnO["staffNameandOccupation"][index] = staffNnO["staffNameandOccupation"][index].split(";")
    for i, info in enumerate(staffNnO["staffNameandOccupation"][index]):
        staffNnO["staffNameandOccupation"][index][i] = staffNnO["staffNameandOccupation"][index][i].split(", ")


# Gera o dataframe
for i in range(len(staffNnO["staffNameandOccupation"])):
    for j, job in enumerate(staffNnO["staffNameandOccupation"][i]):
        if len(staffNnO["staffNameandOccupation"][i][j]) > 1:
            staffNnO["staffNameandOccupation"][i][j][-1] = staffNnO["staffNameandOccupation"][i][j][1].split(",")


# Fazer com que a profissão única seja usada em diferentes animes
unique_profes = []
for i in range(len(staffNnO["staffNameandOccupation"])):
    for j, job in enumerate(staffNnO["staffNameandOccupation"][i]):
        if len(job) > 1:
            for k, profes in enumerate(job[1]):
                if profes not in unique_profes:
                    unique_profes.append(profes)


# Gerando o dataframe
for i in range(len(staffNnO["staffNameandOccupation"])):
    Producer = []
    Director = []
    EpisodeDirector = []
    Storyboard = []
    SoundDirector = []
    KeyAnimation = []
    KeyAnimation2nd = []
    CharacterDesign = []
    Script = []
    SeriesComposition = []
    ThemeSongLyrics = []
    ThemeSongPerformance = []
    ThemeSongArrangement = []
    ThemeSongComposition = []
    AnimationDirector = []
    OriginalCreator = []
    ADRDirector = []
    ExecutiveProducer = []
    ChiefAnimationDirector = []
    DirectorofPhotography = []
    In_BetweenAnimation = []
    BackgroundArt = []
    Planning = []
    ColorDesign = []
    AssistantAnimationDirector = []
    Editing = []
    ArtDirector = []
    Music = []
    ProductionCoordination = []
    DigitalPaint = []
    ColorSetting = []
    AssistantDirector = []
    SoundEffects = []
    InsertedSongPerformance = []
    OriginalCharacterDesign = []
    Setting = []
    Screenplay = []
    AssociateProducer = []
    SpecialEffects = []
    AnimationCheck = []
    ProductionAssistant = []
    SoundSupervisor = []
    PrincipleDrawing = []
    AssistantProducer = []
    ProductionManager = []
    SoundManager = []
    Co_Director = []
    SeriesProductionDirector = []
    MechanicalDesign = []
    PlanningProducer = []
    Layout = []
    ChiefProducer = []
    Recording = []
    DialogueEditing = []
    RecordingEngineer = []
    Creator = []
    RecordingAssistant = []
    Publicity = []
    Co_Producer = []
    CastingDirector = []
    Re_RecordingMixing = []
    AssistantProductionCoordinat = []
    SettingManager = []
    
    # Encontrando profissões únicas para que sejam nossas colunas.
    for j, job in enumerate(staffNnO["staffNameandOccupation"][i]):
        if len(job) > 1:
            for k, profes in enumerate(job[1]):
                if profes == "Producer":
                    Producer.append(job[0])
                elif profes == 'Director':
                    Director.append(job[0])
                elif profes == 'EpisodeDirector':
                    EpisodeDirector.append(job[0])
                elif profes == 'Storyboard':
                    Storyboard.append(job[0])
                elif profes == 'SoundDirector':
                    SoundDirector.append(job[0])
                elif profes == 'KeyAnimation':
                    KeyAnimation.append(job[0])
                elif profes == '2ndKeyAnimation':
                    KeyAnimation2nd.append(job[0])
                elif profes == 'CharacterDesign':
                    CharacterDesign.append(job[0])
                elif profes == 'Script':
                    Script.append(job[0])
                elif profes == 'SeriesComposition':
                    SeriesComposition.append(job[0])
                elif profes == 'ThemeSongLyrics':
                    ThemeSongLyrics.append(job[0])
                elif profes == 'ThemeSongPerformance':
                    ThemeSongPerformance.append(job[0])
                elif profes == 'ThemeSongArrangement':
                    ThemeSongArrangement.append(job[0])
                elif profes == 'ThemeSongComposition':
                    ThemeSongComposition.append(job[0])
                elif profes == 'AnimationDirector':
                    AnimationDirector.append(job[0])
                elif profes == 'OriginalCreator':
                    OriginalCreator.append(job[0])
                elif profes == 'ADRDirector':
                    ADRDirector.append(job[0])
                elif profes == 'ExecutiveProducer':
                    ExecutiveProducer.append(job[0])
                elif profes == 'ChiefAnimationDirector':
                    ChiefAnimationDirector.append(job[0])
                elif profes == 'DirectorofPhotography':
                    DirectorofPhotography.append(job[0])
                elif profes == 'In-BetweenAnimation':
                    In_BetweenAnimation.append(job[0])
                elif profes == 'BackgroundArt':
                    BackgroundArt.append(job[0])
                elif profes == 'Planning':
                    Planning.append(job[0])
                elif profes == 'ColorDesign':
                    ColorDesign.append(job[0])
                elif profes == 'AssistantAnimationDirector':
                    AssistantAnimationDirector.append(job[0])
                elif profes == 'Editing':
                    Editing.append(job[0])
                elif profes == 'ArtDirector':
                    ArtDirector.append(job[0])
                elif profes == 'Music':
                    Music.append(job[0])
                elif profes == 'ProductionCoordination':
                    ProductionCoordination.append(job[0])
                elif profes == 'DigitalPaint':
                    DigitalPaint.append(job[0])
                elif profes == 'ColorSetting':
                    ColorSetting.append(job[0])
                elif profes == 'AssistantDirector':
                    AssistantDirector.append(job[0])
                elif profes == 'SoundEffects':
                    SoundEffects.append(job[0])
                elif profes == 'InsertedSongPerformance':
                    InsertedSongPerformance.append(job[0])
                elif profes == 'OriginalCharacterDesign':
                    OriginalCharacterDesign.append(job[0])
                elif profes == 'Setting':
                    Setting.append(job[0])
                elif profes == 'Screenplay':
                    Screenplay.append(job[0])
                elif profes == 'AssociateProducer':
                    AssociateProducer.append(job[0])
                elif profes == 'SpecialEffects':
                    SpecialEffects.append(job[0])
                elif profes == 'AnimationCheck':
                    AnimationCheck.append(job[0])
                elif profes == 'ProductionAssistant':
                    ProductionAssistant.append(job[0])
                elif profes == 'SoundSupervisor':
                    SoundSupervisor.append(job[0])
                elif profes == 'PrincipleDrawing':
                    PrincipleDrawing.append(job[0])
                elif profes == 'AssistantProducer':
                    AssistantProducer.append(job[0])
                elif profes == 'ProductionManager':
                    ProductionManager.append(job[0])
                elif profes == 'SoundManager':
                    SoundManager.append(job[0])
                elif profes == 'Co-Director':
                    Co_Director.append(job[0])
                elif profes == 'SeriesProductionDirector':
                    SeriesProductionDirector.append(job[0])
                elif profes == 'MechanicalDesign':
                    MechanicalDesign.append(job[0])
                elif profes == 'PlanningProducer':
                    PlanningProducer.append(job[0])
                elif profes == 'Layout':
                    Layout.append(job[0])
                elif profes == 'ChiefProducer':
                    ChiefProducer.append(job[0])
                elif profes == 'Recording':
                    Recording.append(job[0])
                elif profes == 'DialogueEditing':
                    DialogueEditing.append(job[0])
                elif profes == 'RecordingEngineer':
                    RecordingEngineer.append(job[0])
                elif profes == 'Creator':
                    Creator.append(job[0])
                elif profes == 'RecordingAssistant':
                    RecordingAssistant.append(job[0])
                elif profes == 'Publicity':
                    Publicity.append(job[0])
                elif profes == 'Co-Producer':
                    Co_Producer.append(job[0])
                elif profes == 'CastingDirector':
                    CastingDirector.append(job[0])
                elif profes == 'Re-RecordingMixing':
                    Re_RecordingMixing.append(job[0])
                elif profes == 'AssistantProductionCoordinat':
                    AssistantProductionCoordinat.append(job[0])
                elif profes == 'SettingManager':
                    SettingManager.append(job[0])
    
    # Adiciona ao dicionário
    profes_dic["Producer"].append(";".join(Producer))
    profes_dic["Director"].append(";".join(Director))
    profes_dic["EpisodeDirector"].append(";".join(EpisodeDirector))
    profes_dic["Storyboard"].append(";".join(Storyboard))
    profes_dic["SoundDirector"].append(";".join(SoundDirector))
    profes_dic["KeyAnimation"].append(";".join(KeyAnimation))
    profes_dic["2ndKeyAnimation"].append(";".join(KeyAnimation2nd))
    profes_dic["CharacterDesign"].append(";".join(CharacterDesign))
    profes_dic["Script"].append(";".join(Script))
    profes_dic["SeriesComposition"].append(";".join(SeriesComposition))
    profes_dic["ThemeSongLyrics"].append(";".join(ThemeSongLyrics))
    profes_dic["ThemeSongPerformance"].append(";".join(ThemeSongPerformance))
    profes_dic["ThemeSongArrangement"].append(";".join(ThemeSongArrangement))
    profes_dic["ThemeSongComposition"].append(";".join(ThemeSongComposition))
    profes_dic["AnimationDirector"].append(";".join(AnimationDirector))
    profes_dic["OriginalCreator"].append(";".join(OriginalCreator))
    profes_dic["ADRDirector"].append(";".join(ADRDirector))
    profes_dic["ExecutiveProducer"].append(";".join(ExecutiveProducer))
    profes_dic["ChiefAnimationDirector"].append(";".join(ChiefAnimationDirector))
    profes_dic["DirectorofPhotography"].append(";".join(DirectorofPhotography))
    profes_dic["In-BetweenAnimation"].append(";".join(In_BetweenAnimation))
    profes_dic["BackgroundArt"].append(";".join(BackgroundArt))
    profes_dic["Planning"].append(";".join(Planning))
    profes_dic["ColorDesign"].append(";".join(ColorDesign))
    profes_dic["AssistantAnimationDirector"].append(";".join(AssistantAnimationDirector))
    profes_dic["Editing"].append(";".join(Editing))
    profes_dic["ArtDirector"].append(";".join(ArtDirector))
    profes_dic["Music"].append(";".join(Music))
    profes_dic["ProductionCoordination"].append(";".join(ProductionCoordination))
    profes_dic["DigitalPaint"].append(";".join(DigitalPaint))
    profes_dic["ColorSetting"].append(";".join(ColorSetting))
    profes_dic["AssistantDirector"].append(";".join(AssistantDirector))
    profes_dic["SoundEffects"].append(";".join(SoundEffects))
    profes_dic["InsertedSongPerformance"].append(";".join(InsertedSongPerformance))
    profes_dic["OriginalCharacterDesign"].append(";".join(OriginalCharacterDesign))
    profes_dic["Setting"].append(";".join(Setting))
    profes_dic["Screenplay"].append(";".join(Screenplay))
    profes_dic["AssociateProducer"].append(";".join(AssociateProducer))
    profes_dic["SpecialEffects"].append(";".join(SpecialEffects))
    profes_dic["AnimationCheck"].append(";".join(AnimationCheck))
    profes_dic["ProductionAssistant"].append(";".join(ProductionAssistant))
    profes_dic["SoundSupervisor"].append(";".join(SoundSupervisor))
    profes_dic["PrincipleDrawing"].append(";".join(PrincipleDrawing))
    profes_dic["AssistantProducer"].append(";".join(AssistantProducer))
    profes_dic["ProductionManager"].append(";".join(ProductionManager))
    profes_dic["SoundManager"].append(";".join(SoundManager))
    profes_dic["Co-Director"].append(";".join(Co_Director))
    profes_dic["SeriesProductionDirector"].append(";".join(SeriesProductionDirector))
    profes_dic["MechanicalDesign"].append(";".join(MechanicalDesign))
    profes_dic["PlanningProducer"].append(";".join(PlanningProducer))
    profes_dic["Layout"].append(";".join(Layout))
    profes_dic["ChiefProducer"].append(";".join(ChiefProducer))
    profes_dic["Recording"].append(";".join(Recording))
    profes_dic["DialogueEditing"].append(";".join(DialogueEditing))
    profes_dic["RecordingEngineer"].append(";".join(RecordingEngineer))
    profes_dic["Creator"].append(";".join(Creator))
    profes_dic["RecordingAssistant"].append(";".join(RecordingAssistant))
    profes_dic["Publicity"].append(";".join(Publicity))
    profes_dic["Co-Producer"].append(";".join(Co_Producer))
    profes_dic["CastingDirector"].append(";".join(CastingDirector))
    profes_dic["Re-RecordingMixing"].append(";".join(Re_RecordingMixing))
    profes_dic["AssistantProductionCoordinat"].append(";".join(AssistantProductionCoordinat))
    profes_dic["SettingManager"].append(";".join(SettingManager))					
