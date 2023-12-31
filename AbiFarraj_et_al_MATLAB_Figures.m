%% Targeting nanoplastic and microplastic removal in treated wastewater with a simple indicator
% Sinan Abi Farraj, Mathieu Lapointe†, Rafael S. Kurusu, Zhen Liu, Benoit Barbeau, & Nathalie Tufenkji
% Department of Chemical Engineering, McGill University, Montreal H3A 0C5, Quebec, Canada

% Corresponding authors: e-mail address: mathieu.lapointe@etsmtl.ca (M. Lapointe) and nathalie.tufenkji@mcgill.ca (N. Tufenkji)

% October 2023

%% Import Data

    id='MATLAB:table:ModifiedAndSavedVarnames'; warning('off',id);

    file1= strcat('Processed Data/Master_List_NP_Jar_Test.xlsx');
    t= readtable(file1);

    file2= strcat('Processed Data/Master_List_Fibers_Settling_Screening.xlsx');
    t2= readtable(file2);

    file3= strcat('Processed Data/Master_List_Flocculation.xlsx');
    t3= readtable(file3);

    file4= strcat('Processed Data/Master_List_Microfiber.xlsx');
    Microfiber= readtable(file4);

    file5= strcat('Processed Data/Master_List_Microplastic.xlsx');
    Microplastic= readtable(file5);

    file6= strcat('Processed Data/Master_List_Activated_Sludge.xlsx');
    ActSldg= readtable(file6);
    
    file7= strcat('Processed Data/Master_List_MunicipalWastewater_WWTP1.xlsx');
    WWater_LP= readtable(file7);

    file8= strcat('Processed Data/Master_List_Kaolinite_Silica.xlsx');
    KaoSil= readtable(file8);

    file9= strcat('Processed Data/Master_List_Pilot_Scale.xlsx');
    Pilot_Plant= readtable(file9);
   
    file10= strcat('Processed Data/Master_List_PVC_NP_SWW_Jar_Test.xlsx');
    PVC_NP= readtable(file10);

    file11= strcat('Processed Data/Master_List_MunicipalWastewater_WWTP2.xlsx');
    WWater_RP= readtable(file11);

    file12= strcat('Processed Data/Master_List_AeratedLagoons.xlsx');
    Art_Lag= readtable(file12);

    file13= strcat('Processed Data/Master_List_Microfragments.xlsx');
    Microfragment= readtable(file13);

%% Create Variables 

    % Alum 30s data 28 nm Pristine NP
    Coag= 'ALUM';
    Floc= 'aPAM1';
    AorP= 'pristine';
    funct = 'COOH';
    rpm = 110;
    size= 28;
    ST= 30;
    ITurbMin= 40;
    ITurbMax = 65;
    CoagD = 60;
    NP_C = 0.8;
    
    Alum_PNP_30s= t(strcmp(t.Coagulant, Coag)& strcmp(t.Flocculant, Floc) ...
        & t.RPM==rpm & t.NPSize==size & strcmp(t.Function, funct) ...
        &strcmp(t.Aging, AorP) &  t.SettlingTime==ST & t.CoagulantDose==CoagD ...
        & t.InitialTurbidity>ITurbMin & t.InitialTurbidity<ITurbMax,:);

    % Alum- 30s data 28 nm Aged NP
    AorP= 'aged';
    NP_C = 0.8;
    Alum_28_ANP_30s= t(strcmp(t.Coagulant, Coag)& strcmp(t.Flocculant, Floc) ...
        & t.RPM==rpm & t.NPSize==size & strcmp(t.Aging, AorP) ...
        &  t.SettlingTime==ST & t.InitialTurbidity>ITurbMin ...
        & t.InitialTurbidity<ITurbMax,:);
    
    % Alum- 30s data 50 nm Aged NP
    size= 50;
    NP_C = 1.4;

    Alum_50_ANP_30s= t(strcmp(t.Coagulant, Coag)& strcmp(t.Flocculant, Floc) ...
        & t.RPM==rpm & t.NPSize==size & strcmp(t.Aging, AorP) ...
        &  t.SettlingTime==ST & t.InitialTurbidity>ITurbMin ...
        &  strcmp(t.Function, funct)& t.InitialTurbidity<ITurbMax ...
        & t.NPConcentration==NP_C,:);

    % Alum- 30s data 220 nm Aged NP
    size= 220;
    NP_C = 6.3;

    Alum_220_ANP_30s= t(strcmp(t.Coagulant, Coag)& strcmp(t.Flocculant, Floc) ...
        & t.RPM==rpm & t.NPSize==size & strcmp(t.Aging, AorP) ...
        &  t.SettlingTime==ST & t.InitialTurbidity>ITurbMin ...
        & t.InitialTurbidity<ITurbMax,:);

    % Alum 180s data Pristine NP
    Coag= 'ALUM';
    Floc= 'aPAM1';
    AorP= 'pristine';
    rpm = 110;
    size= 28;
    ST= 180;
    ITurbMin= 40;
    ITurbMax = 65;
    NP_C = 0.8;

    Alum_PNP_180s= t(strcmp(t.Coagulant, Coag)& strcmp(t.Flocculant, Floc) ...
        & t.RPM==rpm & t.NPSize==size & strcmp(t.Aging, AorP) ...
        &  t.SettlingTime==ST & t.InitialTurbidity>ITurbMin ...
        & t.InitialTurbidity<ITurbMax,:);

    % ACH 30s data Pristine NP
    Coag= 'ACH';
    Floc= 'aPAM1';
    AorP= 'pristine';
    rpm = 110;
    size= 28;
    ST= 30;
    ITurbMin= 40;
    ITurbMax = 65;
    
    ACH_PNP_30s= t(strcmp(t.Coagulant, Coag)& strcmp(t.Flocculant, Floc) ...
        & t.RPM==rpm & t.NPSize==size & strcmp(t.Aging, AorP) ...
        &  t.SettlingTime==ST & t.InitialTurbidity>ITurbMin ...
        & t.InitialTurbidity<ITurbMax,:);

    % ACH 180s data Pristine NP
    Coag= 'ACH';
    Floc= 'aPAM1';
    AorP= 'pristine';
    rpm = 110;
    size= 28;
    ST= 180;
    ITurbMin= 40;
    ITurbMax = 65;
    
    ACH_PNP_180s= t(strcmp(t.Coagulant, Coag)& strcmp(t.Flocculant, Floc) ...
        & t.RPM==rpm & t.NPSize==size & strcmp(t.Aging, AorP) ...
        &  t.SettlingTime==ST & t.InitialTurbidity>ITurbMin ...
        & t.InitialTurbidity<ITurbMax,:);

    % Alum 30s data 50 nm Aged NP- Neutral
    Coag= 'ALUM';
    Floc= 'aPAM1';
    AorP= 'aged';
    funct = 'none';
    rpm = 110;
    size= 50;
    ST= 30;
    ITurbMin= 40;
    ITurbMax = 60;
    NP_C = 1.4;
    
    Alum_ANP_Nonfunc_30s= t(strcmp(t.Coagulant, Coag)& strcmp(t.Flocculant, Floc) ...
        & t.RPM==rpm & t.NPSize==size & strcmp(t.Function, funct) ...
        &strcmp(t.Aging, AorP) &  t.SettlingTime==ST ...
        & t.InitialTurbidity>ITurbMin & t.InitialTurbidity<ITurbMax,:);

    % Alum 30s data 50 nm Pristine NP-COOH at 0.08ppm
    Coag= 'ALUM';
    Floc= 'aPAM1';
    AorP= 'pristine';
    funct = 'COOH';
    NP_C = 0.08;
    
    Alum_50_PNP_pt1_30s= t(strcmp(t.Coagulant, Coag)& strcmp(t.Flocculant, Floc) ...
        & t.RPM==rpm & t.NPSize==size & strcmp(t.Aging, AorP) ...
        &  t.SettlingTime==ST & t.InitialTurbidity>ITurbMin ...
        &  strcmp(t.Function, funct)& t.InitialTurbidity<ITurbMax ...
        & t.NPConcentration==NP_C,:);

   % Flocculants

    % Alum 30s data 28 nm Pristine NP
    Coag= 'ALUM';
    AorP= 'pristine';
    funct = 'COOH';
    rpm = 110;
    size= 28;
    ST= 30;
    ITurbMin= 40;
    ITurbMax = 65;
    NP_C = 0.8;
    
    Floc= 'aPAM2';
    Alum_aPAM2_30s= t(strcmp(t.Coagulant, Coag)& strcmp(t.Flocculant, Floc) ...
        & t.RPM==rpm & t.NPSize==size & strcmp(t.Function, funct) ...
        &strcmp(t.Aging, AorP) &  t.SettlingTime==ST ...
        & t.InitialTurbidity>ITurbMin & t.InitialTurbidity<ITurbMax,:);
    Alum_aPAM2_180s= t(strcmp(t.Coagulant, Coag)& strcmp(t.Flocculant, Floc) ...
        & t.RPM==rpm & t.NPSize==size & strcmp(t.Function, funct) ...
        &strcmp(t.Aging, AorP) &  t.SettlingTime==180 ...
        & t.InitialTurbidity>ITurbMin & t.InitialTurbidity<ITurbMax,:);

    Floc= 'cPAM1';
    Alum_cPAM1_30s= t(strcmp(t.Coagulant, Coag)& strcmp(t.Flocculant, Floc) ...
        & t.RPM==rpm & t.NPSize==size & strcmp(t.Function, funct) ...
        &strcmp(t.Aging, AorP) &  t.SettlingTime==ST ...
        & t.InitialTurbidity>ITurbMin & t.InitialTurbidity<ITurbMax,:);
    Alum_cPAM1_180s= t(strcmp(t.Coagulant, Coag)& strcmp(t.Flocculant, Floc) ...
        & t.RPM==rpm & t.NPSize==size & strcmp(t.Function, funct) ...
        &strcmp(t.Aging, AorP) &  t.SettlingTime==180 ...
        & t.InitialTurbidity>ITurbMin & t.InitialTurbidity<ITurbMax,:);

    Floc= 'cPAM2';
    Alum_cPAM2_30s= t(strcmp(t.Coagulant, Coag)& strcmp(t.Flocculant, Floc) ...
        & t.RPM==rpm & t.NPSize==size & strcmp(t.Function, funct) ...
        &strcmp(t.Aging, AorP) &  t.SettlingTime==ST ...
        & t.InitialTurbidity>ITurbMin & t.InitialTurbidity<ITurbMax,:);
    Alum_cPAM2_180s= t(strcmp(t.Coagulant, Coag)& strcmp(t.Flocculant, Floc) ...
        & t.RPM==rpm & t.NPSize==size & strcmp(t.Function, funct) ...
        &strcmp(t.Aging, AorP) &  t.SettlingTime==180 ...
        & t.InitialTurbidity>ITurbMin & t.InitialTurbidity<ITurbMax,:);
   
    % RPM
    Coag= 'ALUM';
    Floc= 'aPAM1';
    AorP= 'pristine';
    funct = 'COOH';
    size= 28;
    ST= 30;
    ITurbMin= 40;
    ITurbMax = 60;
    
    rpm = 150;
    RPM_150_30s= t(strcmp(t.Coagulant, Coag)& strcmp(t.Flocculant, Floc) ...
        & t.RPM==rpm & t.NPSize==size & strcmp(t.Function, funct) ...
        &strcmp(t.Aging, AorP) &  t.SettlingTime==ST ...
        & t.InitialTurbidity>ITurbMin & t.InitialTurbidity<ITurbMax,:);
    rpm = 200;
    RPM_200_30s= t(strcmp(t.Coagulant, Coag)& strcmp(t.Flocculant, Floc) ...
        & t.RPM==rpm & t.NPSize==size & strcmp(t.Function, funct) ...
        &strcmp(t.Aging, AorP) &  t.SettlingTime==ST ...
        & t.InitialTurbidity>ITurbMin & t.InitialTurbidity<ITurbMax,:);
    rpm = 250;
    RPM_250_30s= t(strcmp(t.Coagulant, Coag)& strcmp(t.Flocculant, Floc) ...
        & t.RPM==rpm & t.NPSize==size & strcmp(t.Function, funct) ...
        &strcmp(t.Aging, AorP) &  t.SettlingTime==ST ...
        & t.InitialTurbidity>ITurbMin & t.InitialTurbidity<ITurbMax,:);
    rpm = 300;
    RPM_300_30s= t(strcmp(t.Coagulant, Coag)& strcmp(t.Flocculant, Floc) ...
        & t.RPM==rpm & t.NPSize==size & strcmp(t.Function, funct) ...
        &strcmp(t.Aging, AorP) &  t.SettlingTime==ST ...
        & t.InitialTurbidity>ITurbMin & t.InitialTurbidity<ITurbMax,:);

    % Low and High Turb
    Coag= 'ALUM';
    Floc= 'aPAM1';
    AorP= 'pristine';
    funct = 'COOH';
    rpm = 110;
    size= 28;
    ST= 30;

    
    ITurbMin= 0;
    ITurbMax = 40;
    Low_Turb_30s= t(strcmp(t.Coagulant, Coag)& strcmp(t.Flocculant, Floc) ...
        & t.RPM==rpm & t.NPSize==size & strcmp(t.Function, funct) ...
        &strcmp(t.Aging, AorP) &  t.SettlingTime==ST ...
        & t.InitialTurbidity>ITurbMin & t.InitialTurbidity<ITurbMax,:);

    ITurbMin= 60;
    ITurbMax = 100;
    High_Turb_30s= t(strcmp(t.Coagulant, Coag)& strcmp(t.Flocculant, Floc) ...
        & t.RPM==rpm & t.NPSize==size & strcmp(t.Function, funct) ...
        &strcmp(t.Aging, AorP) &  t.SettlingTime==ST ...
        & t.InitialTurbidity>ITurbMin & t.InitialTurbidity<ITurbMax,:);
    
    
    % Fibers
    Settling= t2(strcmp(t2.SettlingTime, '30') | strcmp(t2.SettlingTime, '30'),:);
    Screening= t2(strcmp(t2.SettlingTime, 'NaN'),:);
    noFiber = t2(strcmp(t2.IronConcSynthesis, 'NaN'),:);
    pristineFiber = t2(strcmp(t2.IronConcSynthesis, 'pristine'),:);
    FeFiber = t2(strcmp(t2.IronConcSynthesis, '84'),:);

    noFiber_Set = t2(strcmp(t2.IronConcSynthesis, 'NaN')& strcmp(t2.SettlingTime, '30'),:);
    noFiber_Scr = t2(strcmp(t2.IronConcSynthesis, 'NaN')& strcmp(t2.SettlingTime, 'NaN'),:);
    pristineFiber_Set = t2(strcmp(t2.IronConcSynthesis, 'pristine')& strcmp(t2.SettlingTime, '30'),:);
    pristineFiber_Scr = t2(strcmp(t2.IronConcSynthesis, 'pristine')& strcmp(t2.SettlingTime, 'NaN'),:);
    FeFiber_Set = t2(strcmp(t2.IronConcSynthesis, '84')& strcmp(t2.SettlingTime, '30'),:);
    FeFiber_Scr = t2(strcmp(t2.IronConcSynthesis, '84')& strcmp(t2.SettlingTime, 'NaN'),:);


    % Flocculation time
    
    ST= 30;
    Floc_30= t3(t3.SettlingTime==ST,:);
    Floc_180= t3(t3.SettlingTime==180,:);

    % Kaolinite/ Silica Data

    ST= 30;
    KaoSil_30= KaoSil(KaoSil.SettlingTime==ST,:);
    KaoSil_180= KaoSil(KaoSil.SettlingTime==180,:);

    % PVC NP Data

    ST= 30;
    PVC_30= PVC_NP(PVC_NP.SettlingTime==ST,:);
    PVC_180= PVC_NP(PVC_NP.SettlingTime==180,:);



%% Plotting

% Figure 1

% 1a) ACH vs Alum
%{
    figure
    set(gcf,'Position',[184,402,480,348]);
    
    size=75;
    h1=scatter (Alum_PNP_30s{:,end-1}*100, Alum_PNP_30s{:,end}*100,size,'d','MarkerEdgeColor','k','LineWidth',2);
    hold on
    h3=scatter (ACH_PNP_30s{:,end-1}*100, ACH_PNP_30s{:,end}*100,size,'s','MarkerEdgeColor','k','LineWidth',2);
    scatter (Alum_28_ANP_30s{:,end-1}*100, Alum_28_ANP_30s{:,end}*100,size,'^','MarkerEdgeColor','k','LineWidth',2)
    scatter (Alum_50_ANP_30s{:,end-1}*100, Alum_50_ANP_30s{:,end}*100,size,'v','MarkerEdgeColor','k','LineWidth',2)
    scatter (Alum_ANP_Nonfunc_30s{:,end-1}*100, Alum_ANP_Nonfunc_30s{:,end}*100,size,'<','MarkerEdgeColor','k','LineWidth',2)
    scatter (Alum_220_ANP_30s{:,end-1}*100, Alum_220_ANP_30s{:,end}*100,size,'o','MarkerEdgeColor','k','LineWidth',2)


    scatter (Alum_PNP_30s{:,end-1}*100, Alum_PNP_30s{:,end}*100,size,Alum_PNP_30s.pH, 'd','filled')
    scatter (ACH_PNP_30s{:,end-1}*100, ACH_PNP_30s{:,end}*100,size,ACH_PNP_30s.pH,'s','filled')
    scatter (Alum_28_ANP_30s{:,end-1}*100, Alum_28_ANP_30s{:,end}*100,size,Alum_28_ANP_30s.pH,'^','filled')
    scatter (Alum_50_ANP_30s{:,end-1}*100, Alum_50_ANP_30s{:,end}*100,size,Alum_50_ANP_30s.pH,'v','filled')
    scatter (Alum_ANP_Nonfunc_30s{:,end-1}*100, Alum_ANP_Nonfunc_30s{:,end}*100,size,Alum_ANP_Nonfunc_30s.pH,'<','filled')
    scatter (Alum_220_ANP_30s{:,end-1}*100, Alum_220_ANP_30s{:,end}*100,size,Alum_220_ANP_30s.pH,'o','filled')
    hold off
        box on
        set(gca,'FontSize',18,'LineWidth',2)
        xlim([0,100])
        ylim([0,100])
        yticks([0:20:100])
        xticks([0:20:100])

    yticklabels({"",20,40,60,80,100})
    xticklabels({0,20,40,60,80,100})
    ylabel('Nanoplastic removal (%)','HorizontalAlignment','center');
    xlabel('Total suspended solids removal (%)','HorizontalAlignment','center')    
    legend({'28 nm (-COOH; pristine; alum)','28 nm (-COOH; pristine; ACH)','28 nm (-COOH; aged; alum)', ...
        '50 nm (-COOH; aged; alum)','50 nm (neutral; aged; alum)','220 nm (-COOH; aged; alum)'},'Location',...
        'Northwest','NumColumns',1,'Position',[0.12,0.725,0.613,0.178]);
    legend boxoff 
    
   
    c=colorbar;
    colormap turbo;
    c.Location= 'north';
    c.AxisLocation = 'in';
    c.Position=[0.146370023419203,0.698101968817571,0.460187353629977,0.020559904827695];

    c.Label.String = 'pH';
    c.Label.Position= [6.94681782937687,-3.625697135925293,0];
    c.Label.Rotation=0;
    text(90,10,'a','HorizontalAlignment','center','FontSize',20,'Color','k','FontWeight', 'Bold')


%}

% 1c) Flocculation time
%{    
    Color1= '#5f5b7a';
    Color2= [0.8500 0.3250 0.0980];

    figure
    set(gcf,'Position',[184,451,539,299])
    semilogx(Floc_30.FlocTime, Floc_30{:,end}*100,'d','MarkerSize', 10,'MarkerEdgeColor',Color1,'MarkerFaceColor',Color1)
    hold on
    semilogx(Floc_30.FlocTime, Floc_30{:,end-1}*100,'s','MarkerSize', 10,'MarkerEdgeColor',Color2,'MarkerFaceColor',Color2)

    hold off
        box on
        set(gca,'FontSize',18,'LineWidth',2)
        ylim([0,100])
        yticks([0:20:100])

    %yticklabels({"",10,20,30,40,50,60,70,80,90,100})
    yticklabels({"",20,40,60,80,100})
    a=[10:20:30,100:200:300,1000:2000:3000,10000];
    xticks(a)
    xticklabels(a)
    ylabel('Removal (%)','HorizontalAlignment','center');
    xlabel('Flocculation time (s)','HorizontalAlignment','center')
    legend({'nanoplastic','TSS'},'Location',[0.652,0.3964,0.22,0.135]);
    legend boxoff 
    text(15,90,'c','HorizontalAlignment','center','FontSize',20,'Color','k','FontWeight', 'Bold')

   
%}



% Figure 2

% 2a) Coagulant- Alum/ACH
%{
    Color1= '#5f5b7a';
    Color2= [0.8500 0.3250 0.0980];
    
    figure
    set(gcf,'Position',[184,402,427,303])
    scatter (Alum_PNP_30s{:,end-1}*100, Alum_PNP_30s{:,end}*100,100,'d','MarkerEdgeColor',Color1,'MarkerFaceColor',Color1)
    hold on
    scatter (ACH_PNP_30s{:,end-1}*100, ACH_PNP_30s{:,end}*100,100,'s','MarkerEdgeColor',Color2,'MarkerFaceColor',Color2)
       
        box on
        ax = gca;

        ax.XAxis.MinorTick = 'on';
        ax.XAxis.MinorTickValues = 10:10:90;
        ax.YAxis.MinorTick = 'on';
        ax.YAxis.MinorTickValues = 10:10:90;
        set(gca,'FontSize',18,'LineWidth',1.5)
        xlim([0,100])
        ylim([0,100])
        yticks(0:20:100)

    NP= Alum_PNP_30s{:,end};
    TSS= Alum_PNP_30s{:,end-1};
    [param,R2,RMSE]= find_param(TSS,NP)
    plot(5:1:95,(1-(1-[5:1:95]*0.01).^param)*100,'--','Color','k','LineWidth',2)
    plot(5:1:95,(1-(1-[5:1:95]*0.01).^param)*100,'--','Color',Color1,'LineWidth',2)
    text(80,20,strcat('R^{2}= ',string(round(R2,2))),'HorizontalAlignment','right','FontSize',14,'Color',Color1,'FontWeight', 'Bold')


    NP= ACH_PNP_30s{:,end};
    TSS= ACH_PNP_30s{:,end-1};
    [param,R2,RMSE]= find_param(TSS,NP)
    plot(5:1:95,(1-(1-[5:1:95]*0.01).^param)*100,'--','Color',Color2,'LineWidth',2)
    text(38,58,strcat('R^{2}= ',string(round(R2,2))),'HorizontalAlignment','center','FontSize',14,'Color',Color2,'FontWeight', 'Bold')

    text(90,10,'a','HorizontalAlignment','center','FontSize',20,'Color','k','FontWeight', 'Bold')
    hold off
    yticklabels({"",20,40,60,80,100})
    ylabel('Nanoplastic removal (%)','HorizontalAlignment','center','Color','k');
    xlabel('Total suspended solids removal (%)','HorizontalAlignment','center','Color','k')
    legend({'alum','aluminum chlorohydrate','orthokinetic model'},'Location', 'Northwest');
    legend boxoff 
%}


% 2b) NP Size- 28, 50, and 220
%{
Color1= '#e8ba81';
Color2= '#33aab2';
Color3= '#993710';
Color4= '#013463';
Color0= [0.50,0.41,0.56];

 figure
    set(gcf,'Position',[184,402,427,303])
    scatter (Alum_28_ANP_30s{:,end-1}*100, Alum_28_ANP_30s{:,end}*100,100,'d','MarkerEdgeColor',Color1,'MarkerFaceColor',Color1)
    hold on
    scatter (Alum_50_ANP_30s{:,end-1}*100, Alum_50_ANP_30s{:,end}*100,100,'s','MarkerEdgeColor',Color2,'MarkerFaceColor',Color2)
    scatter (Alum_220_ANP_30s{:,end-1}*100, Alum_220_ANP_30s{:,end}*100,100,'s','MarkerEdgeColor',Color3,'MarkerFaceColor',Color3)
 
        box on
        ax = gca;

        ax.XAxis.MinorTick = 'on';
        ax.XAxis.MinorTickValues = 10:10:90;
        ax.YAxis.MinorTick = 'on';
        ax.YAxis.MinorTickValues = 10:10:90;
        set(gca,'FontSize',18,'LineWidth',1.5)
        xlim([0,100])
        ylim([0,100])
        yticks(0:20:100)

    NP= [Alum_28_ANP_30s{:,end};Alum_50_ANP_30s{:,end};Alum_220_ANP_30s{:,end}];
    TSS= [Alum_28_ANP_30s{:,end-1};Alum_50_ANP_30s{:,end-1};Alum_220_ANP_30s{:,end-1}];
        fprintf("28 aged NP\n")
        [param,R2,RMSE]= find_param(Alum_28_ANP_30s{:,end-1},Alum_28_ANP_30s{:,end})
        fprintf("50 aged NP\n")
        [param,R2,RMSE]= find_param(Alum_50_ANP_30s{:,end-1},Alum_50_ANP_30s{:,end})
        fprintf("220 aged NP\n")
        [param,R2,RMSE]= find_param(Alum_220_ANP_30s{:,end-1},Alum_220_ANP_30s{:,end})
    fprintf("\ncombined\n")
    N=length(NP)
    [param,R2,RMSE]= find_param(TSS,NP)
    plot(5:1:95,(1-(1-[5:1:95]*0.01).^param)*100,'--','Color','k','LineWidth',2)
    text(35,40,strcat('R^{2}= ',string(round(R2,2))),'HorizontalAlignment','right','FontSize',14,'Color','k','FontWeight', 'Bold')


    text(90,10,'b','HorizontalAlignment','center','FontSize',20,'Color','k','FontWeight', 'Bold')
    hold off
    yticklabels({"",20,40,60,80,100})
    ylabel('Nanoplastic removal (%)','HorizontalAlignment','center');
    xlabel('Total suspended solids removal (%)','HorizontalAlignment','center')
    legend({'28 nm (aged)','50 nm (aged)', '220 nm (aged)', 'orthokinetic model'},'Location', 'Northwest');

    legend boxoff 

%}



% 2c) NP Functionalization- 50 nm
%{
Color1= '#33aab2';
Color2= '#6eb503';
Color4= '#013463';
Color5= '#752414';

 figure
    set(gcf,'Position',[184,402,427,303])
    scatter (Alum_50_ANP_30s{:,end-1}*100, Alum_50_ANP_30s{:,end}*100,100,'s','MarkerEdgeColor',Color1,'MarkerFaceColor',Color1)
    hold on
    scatter (Alum_50_PNP_pt1_30s{:,end-1}*100, Alum_50_PNP_pt1_30s{:,end}*100,100,'^','MarkerEdgeColor',Color5,'MarkerFaceColor',Color5)
    scatter (Alum_ANP_Nonfunc_30s{:,end-1}*100, Alum_ANP_Nonfunc_30s{:,end}*100,100,'MarkerEdgeColor',Color2,'MarkerFaceColor',Color2)

    
        box on
        ax = gca;
        ax.XAxis.MinorTick = 'on';
        ax.XAxis.MinorTickValues = 10:10:90;
        ax.YAxis.MinorTick = 'on';
        ax.YAxis.MinorTickValues = 10:10:90;
        set(gca,'FontSize',18,'LineWidth',1.5)
        xlim([0,100])
        ylim([0,100])
        yticks(0:20:100)


    NP= [Alum_50_ANP_30s{:,end};Alum_ANP_Nonfunc_30s{:,end};Alum_50_PNP_pt1_30s{:,end}];
    TSS= [Alum_50_ANP_30s{:,end-1};Alum_ANP_Nonfunc_30s{:,end-1};Alum_50_PNP_pt1_30s{:,end-1}];
    fprintf("\ncombined\n")
    N=length(NP)
    [param,R2,RMSE]= find_param(TSS,NP)
    plot(5:1:95,(1-(1-[5:1:95]*0.01).^param)*100,'--','Color','k','LineWidth',2)
    text(35,40,strcat('R^{2}= ',string(round(R2,2))),'HorizontalAlignment','right','FontSize',14,'Color','k','FontWeight', 'Bold')


    text(90,10,'c','HorizontalAlignment','center','FontSize',20,'Color','k','FontWeight', 'Bold')
    hold off
    yticklabels({"",20,40,60,80,100})
    ylabel('Nanoplastic removal (%)','HorizontalAlignment','center');
    xlabel('Total suspended solids removal (%)','HorizontalAlignment','center')
    legend({'50 nm (COOH; 1.4 ppm)','50 nm (COOH; 0.08 ppm)','50 nm (none; 1.4 ppm)', 'orthokinetic model'},'Location', 'Northwest');
    legend boxoff 

    fprintf('Data for carboxylate')
    [param,R2,RMSE]= find_param(Alum_50_ANP_30s{:,end-1},Alum_50_ANP_30s{:,end})
    fprintf('Data for nonfunctionalized')
    [param,R2,RMSE]= find_param(Alum_ANP_Nonfunc_30s{:,end-1},Alum_ANP_Nonfunc_30s{:,end})
    
%}



% 2d) PVC
%{ 

Color0= [0.51,0.20,0.71];
Color_fit= [0.50,0.41,0.56];


 figure
    set(gcf,'Position',[184,402,427,303])
    scatter (PVC_30{:,end-1}*100, PVC_30{:,end}*100,100,'o','MarkerEdgeColor',Color0,'MarkerFaceColor',Color0,'LineWidth',2)
    hold on

    NP= PVC_30{:,end};
    TSS= PVC_30{:,end-1};

    [param,R2,RMSE]= find_param(TSS,NP)
    plot(5:1:99,(1-(1-[5:1:99]*0.01).^param)*100,'--','Color',Color_fit,'LineWidth',2)
    text(35,40,strcat('R^{2}= ',string(round(R2,2))),'HorizontalAlignment','right','FontSize',14,'Color','k','FontWeight', 'Bold')

    
        box on
        ax = gca;

        ax.XAxis.MinorTick = 'on';
        ax.XAxis.MinorTickValues = 10:10:90;
        ax.YAxis.MinorTick = 'on';
        ax.YAxis.MinorTickValues = 10:10:90;
        set(gca,'FontSize',18,'LineWidth',1.5)
        xlim([0,100])
        ylim([0,100])
        yticks(0:20:100)

    text(90,10,'d','HorizontalAlignment','center','FontSize',20,'Color','k','FontWeight', 'Bold')
    hold off
    yticklabels({"",20,40,60,80,100})
    ylabel('Nanoplastic removal (%)','HorizontalAlignment','center');
    xlabel('Total suspended solids removal (%)','HorizontalAlignment','center')
    legend({'250 nm PVC (non-functionalized)', 'orthokinetic model'},'Location', 'Northwest');
    legend boxoff 

% Plot with 50 nm NPs

Color1= '#33aab2';
Color2= '#6eb503';
Color4= '#013463';
Color5= '#752414';
Color6= [0.50,0.41,0.56];

%}


% Figure 3

% 3a) Flocculant 
%{
Color1= '#5f5b7a';
Color2= '#7FC7AF';
Color3= '#FA6A64';
Color5= '#675149';
Color_fit = '#5f5b7a';

 figure
    set(gcf,'Position',[184,402,427,303])
    scatter (Alum_PNP_30s{:,end-1}(Alum_PNP_30s.pH<7.201)*100, Alum_PNP_30s{:,end}(Alum_PNP_30s.pH<7.201)*100,100,'d','MarkerEdgeColor',Color1,'MarkerFaceColor',Color1)
    hold on
    scatter (Alum_PNP_180s{:,end-1}(Alum_PNP_180s.pH<7.201)*100, Alum_PNP_180s{:,end}(Alum_PNP_180s.pH<7.201)*100,100,'d','MarkerEdgeColor','k','MarkerFaceColor',Color1,'LineWidth',2)
    scatter (Alum_aPAM2_30s{:,end-1}*100, Alum_aPAM2_30s{:,end}*100,100,'>','MarkerEdgeColor',Color2,'MarkerFaceColor',Color2)
    scatter (Alum_cPAM1_30s{:,end-1}*100, Alum_cPAM1_30s{:,end}*100,100,'^','MarkerEdgeColor',Color3,'MarkerFaceColor',Color3)
    scatter (Alum_cPAM2_30s{:,end-1}*100, Alum_cPAM2_30s{:,end}*100,100,'s','MarkerEdgeColor',Color5,'MarkerFaceColor',Color5)
    scatter (Alum_aPAM2_180s{:,end-1}*100, Alum_aPAM2_180s{:,end}*100,100,'>','MarkerEdgeColor','k','MarkerFaceColor',Color2,'LineWidth',2)
    scatter (Alum_cPAM1_180s{:,end-1}*100, Alum_cPAM1_180s{:,end}*100,100,'^','MarkerEdgeColor','k','MarkerFaceColor',Color3,'LineWidth',2)
    scatter (Alum_cPAM2_180s{:,end-1}*100, Alum_cPAM2_180s{:,end}*100,100,'s','MarkerEdgeColor','k','MarkerFaceColor',Color5,'LineWidth',2)


    NP= [Alum_PNP_30s{:,end}(Alum_PNP_30s.pH<7.201);Alum_PNP_180s{:,end}(Alum_PNP_180s.pH<7.201);Alum_aPAM2_30s{:,end};Alum_aPAM2_180s{:,end};Alum_cPAM1_30s{:,end};Alum_cPAM1_180s{:,end};Alum_cPAM2_30s{:,end};Alum_cPAM2_180s{:,end}];
    TSS= [Alum_PNP_30s{:,end-1}(Alum_PNP_30s.pH<7.201);Alum_PNP_180s{:,end-1}(Alum_PNP_180s.pH<7.201);Alum_aPAM2_30s{:,end-1};Alum_aPAM2_180s{:,end-1};Alum_cPAM1_30s{:,end-1};Alum_cPAM1_180s{:,end-1};Alum_cPAM2_30s{:,end-1};Alum_cPAM2_180s{:,end-1}];
    
    [param,R2,RMSE]= find_param(TSS,NP)
    [param,aR2,RMSE]= find_param(Alum_PNP_30s{:,end-1},Alum_PNP_30s{:,end})
    plot(5:1:95,(1-(1-[5:1:95]*0.01).^param)*100,'--','Color',Color_fit,'LineWidth',2)

        box on
        ax = gca;
        %ax.XColor = '#808080';
        %ax.YColor = '#808080';
        ax.XAxis.MinorTick = 'on';
        ax.XAxis.MinorTickValues = 10:10:90;
        ax.YAxis.MinorTick = 'on';
        ax.YAxis.MinorTickValues = 10:10:90;
        set(gca,'FontSize',18,'LineWidth',1.5)
        xlim([0,100])
        ylim([20,100])
        yticks(20:20:100)

    p_test_NP=zeros(4,4);
    data_NP={Alum_PNP_180s{:,end}(Alum_PNP_180s.pH<7.201);Alum_aPAM2_180s{:,end};Alum_cPAM1_180s{:,end};Alum_cPAM2_180s{:,end}};
    for i=1:4
          for j=1:4
              [type, h,p_NP]= stat_test(data_NP{i},data_NP{j});
              p_test_NP(i,j) = p_NP;
          end
    end
    p_test_NP;

    text(90,30,'a','HorizontalAlignment','center','FontSize',20,'Color','k','FontWeight', 'Bold')
    hold off
    yticklabels({"",40,60,80,100})
    ylabel('Nanoplastic removal (%)','HorizontalAlignment','center');
    xlabel('Total suspended solids removal (%)','HorizontalAlignment','center')
    legend({'aPAM1 (<5% CD; high MW)','','aPAM2 (<5% CD; very high MW)', 'cPAM1 (~7% CD; high MW)', 'cPAM2 (~20% CD; high MW)','','','','model-aPAM1'},'Location', 'best');
    legend boxoff 

%}
  

% 3b) Fibers based on floc separation
%{
    Color1= [0.66,0.08,0.18];
    Color2= [0.69,0.70,0.07];
    Color3= '#ba3bd3';
    
    figure
    set(gcf,'Position',[184,402,427,303])
    scatter (Settling{:,end-1}*100, Settling{:,end}*100,100,'d','MarkerEdgeColor','k','LineWidth',1)
    hold on
    scatter (Screening{:,end-1}*100, Screening{:,end}*100,100,'s','MarkerEdgeColor','k','LineWidth',1)

    scatter (noFiber_Set{:,end-1}*100, noFiber_Set{:,end}*100,100,'d','MarkerFaceColor',Color1,'MarkerEdgeColor','k','LineWidth',1)    
    scatter (noFiber_Scr{:,end-1}*100, noFiber_Scr{:,end}*100,100,'s','MarkerFaceColor',Color1,'MarkerEdgeColor','k','LineWidth',1)
    scatter (pristineFiber_Set{:,end-1}*100, pristineFiber_Set{:,end}*100,100,'d','MarkerFaceColor',Color2,'MarkerEdgeColor','k','LineWidth',1)
    scatter (pristineFiber_Scr{:,end-1}*100, pristineFiber_Scr{:,end}*100,100,'s','MarkerFaceColor',Color2,'MarkerEdgeColor','k','LineWidth',1)
    scatter (FeFiber_Set{:,end-1}*100, FeFiber_Set{:,end}*100,100,'d','MarkerFaceColor',Color3,'MarkerEdgeColor','k','LineWidth',1)
    scatter (FeFiber_Scr{:,end-1}*100, FeFiber_Scr{:,end}*100,100,'s','MarkerFaceColor',Color3,'MarkerEdgeColor','k','LineWidth',1)
       
        box on
        ax = gca;
        ax.XAxis.MinorTick = 'on';
        ax.XAxis.MinorTickValues = 10:10:90;
        ax.YAxis.MinorTick = 'on';
        ax.YAxis.MinorTickValues = 10:10:90;
        set(gca,'FontSize',18,'LineWidth',1.5)
        xlim([0,100])
        ylim([0,100])
        yticks(0:20:100)

    NP= [Settling{:,end};Screening{:,end}];
    TSS= [Settling{:,end-1};Screening{:,end-1}];
    [param,R2,RMSE]= find_param(TSS,NP)
    plot(5:1:95,(1-(1-[5:1:95]*0.01).^param)*100,'--','Color','k','LineWidth',2)
    text(80,20,strcat('R^{2}= ',string(round(R2,2))),'HorizontalAlignment','right','FontSize',14,'Color','k','FontWeight', 'Bold')
    

    fprintf('screening')
    [param,R2,RMSE]= find_param(Screening{:,end-1},Screening{:,end})
    fprintf('settling')
    [param,R2,RMSE]= find_param(Settling{:,end-1},Settling{:,end})

    text(90,10,'b','HorizontalAlignment','center','FontSize',20,'Color','k','FontWeight', 'Bold')
    hold off
    yticklabels({"",20,40,60,80,100})
    ylabel('Nanoplastic removal (%)','HorizontalAlignment','center');
    xlabel('Total suspended solids removal (%)','HorizontalAlignment','center')
    
    text(5,95,'Aggregation Method','HorizontalAlignment','left','FontSize',16,'Color','k','FontWeight', 'Bold')
 % {
    line([7.5,10],[86,86],'lineWidth',5,'Color',Color1)
    text(13,86,'no fibers','HorizontalAlignment','left','VerticalAlignment','middle','FontSize',16,'Color','k')
    line([7.5,10],[77,77],'lineWidth',5,'Color',Color2)
    text(13,77,'pristine fibers','HorizontalAlignment','left','VerticalAlignment','middle','FontSize',16,'Color','k')
    line([7.5,10],[68,68],'lineWidth',5,'Color',Color3)
    text(13,68,'Fe-fibers','HorizontalAlignment','left','VerticalAlignment','middle','FontSize',16,'Color','k')
    % }

    legend({'settling','screening','','','','','','','','','','','','','',''},'Location', [0.167,0.44,0.262,0.140],'FontSize',16);

    text(5,58,'Seperation Method','HorizontalAlignment','left','FontSize',16,'Color','k','FontWeight', 'Bold')


    legend boxoff
%}

% 3c) RPM and S3)
%{
Color0= '#5f5b7a' ;
Color1= '#f17f74';
Color2= '#ec85f2';
Color3= [1.00,0.07,0.65];
Color4='#808080';

 figure
    set(gcf,'Position',[184,402,427,303])
    scatter (Alum_PNP_30s{:,end-1}*100, Alum_PNP_30s{:,end}*100,100,'d','MarkerEdgeColor',Color0,'MarkerFaceColor',Color0)
    hold on
    scatter (RPM_150_30s{:,end-1}*100, RPM_150_30s{:,end}*100,100,'MarkerEdgeColor',Color1,'MarkerFaceColor',Color1)
    scatter (RPM_200_30s{:,end-1}*100, RPM_200_30s{:,end}*100,100,'>','MarkerEdgeColor',Color2,'MarkerFaceColor',Color2)
    scatter (RPM_250_30s{:,end-1}*100, RPM_250_30s{:,end}*100,100,'^','MarkerEdgeColor',Color3,'MarkerFaceColor',Color3)
    scatter (RPM_300_30s{:,end-1}*100, RPM_300_30s{:,end}*100,100,'s','MarkerEdgeColor',Color4,'MarkerFaceColor',Color4)

    NP= Alum_PNP_30s{:,end};
    TSS= Alum_PNP_30s{:,end-1};
    [param,R2,RMSE]= find_param(TSS,NP);
    plot(5:1:95,(1-(1-[5:1:95]*0.01).^param)*100,'--','Color',Color0,'LineWidth',2)
    text(80,20,strcat('R^{2}= ',string(round(R2,2))),'HorizontalAlignment','right','FontSize',14,'Color',Color0,'FontWeight', 'Bold')

        box on
        ax = gca;
        ax.XAxis.MinorTick = 'on';
        ax.XAxis.MinorTickValues = 10:10:90;
        ax.YAxis.MinorTick = 'on';
        ax.YAxis.MinorTickValues = 10:10:90;
        set(gca,'FontSize',18,'LineWidth',1.5)
        xlim([0,100])
        ylim([0,100])
        yticks(0:20:100)

    text(90,10,'c','HorizontalAlignment','center','FontSize',20,'Color','k','FontWeight', 'Bold')
    hold off
    yticklabels({"",20,40,60,80,100})
    ylabel('Nanoplastic removal (%)','HorizontalAlignment','center');
    xlabel('Total suspended solids removal (%)','HorizontalAlignment','center')
    legend({'110 rpm','150 rpm', '200 rpm', '250 rpm','300 rpm','model- 110 rpm'},'Location', 'Northwest');
    legend boxoff 



    index = [1,2,3,4,5];
    Color={'#5f5b7a' ;'#f17f74'; '#ec85f2';[1.00,0.07,0.65];'#808080';'#fc9783'};
    data = {Alum_PNP_30s{:,end}(Alum_PNP_30s.pH<7.2)*100, RPM_150_30s{:,end}*100,RPM_200_30s{:,end}*100,RPM_250_30s{:,end}*100,RPM_300_30s{:,end}*100};

    n=length(data);
    p_test=zeros(n,n);
    type_test=zeros(n,n);
    for i=1:n
          for j=1:n
              [type, h,p]= stat_test(data{i},data{j});
              p_test(i,j) = p;
              type
              if strlength(type)==7;t=0;
              elseif strlength(type)==5;t=1;end
              type_test(i,j)= t;
          end
    end
    p_test
    type_test

    figure
    set(gcf,'Position',[184,402,427,303])
    avger= zeros(length(index), 1);
    stdev = zeros(length(index), 1);
    std_er= zeros(length(index), 1);
        
        for i = 1:length(index)
            avger(i,1) = mean(data{i},1);
            stdev(i,1) = std(data{i});
        end
    
        for i = 1:length(index)
        bar(index(i),avger(i),'facecolor', Color{i},'EdgeColor', 'k','barwidth',0.6);  
        hold on
        txt1=append(string(round(avger(i),0)),'%');
        text(index(i),40,txt1,'HorizontalAlignment','center','FontSize',14,'Color','white','FontWeight', 'Bold')
        end

        er1 = errorbar(index,avger(:,1),stdev(:,1),stdev(:,1));
        er1.Color = [0 0 0];                            
        er1.LineStyle = 'none'; 
        er1.LineWidth = 2;
        
        scatter (index(1), data{1},100,'x','MarkerEdgeColor','k','MarkerFaceColor','k','MarkerFaceAlpha',1,'LineWidth',1)
        scatter (index(2), data{2},100,'x','MarkerEdgeColor','k','MarkerFaceColor','k','MarkerFaceAlpha',1,'LineWidth',1)
        scatter (index(3), data{3},100,'x','MarkerEdgeColor','k','MarkerFaceColor','k','MarkerFaceAlpha',1,'LineWidth',1)
        scatter (index(4), data{4},100,'x','MarkerEdgeColor','k','MarkerFaceColor','k','MarkerFaceAlpha',1,'LineWidth',1)
        scatter (index(5), data{5},100,'x','MarkerEdgeColor','k','MarkerFaceColor','k','MarkerFaceAlpha',1,'LineWidth',1)

                        
        xlim([0.5,5.5]);
        xticks(index)
        xticklabels({'110','150','200','250','300'})
        xtickangle(0)
        xlabel('RPM');
        ax=gca;
        set(gca,'FontSize',18,'LineWidth',1.5)
        ylim([0,100])
        ax.YAxis.MinorTick = 'on';
        ax.YAxis.MinorTickValues = 0:10:90;
        yticks(0:20:100)
        ylabel('Nanoplastic removal (%)');
        set(gca,'FontSize',18)
        box on

%}


% 3d) Kaolinite and Silica + turbidity
%{ 

Color0= '#02c39a';
Color4= '#d45113';
Color1= '#9e2a2b';
Color2= '#592e83';
Color_fit = '#ef233c';


 figure
    set(gcf,'Position',[184,402,427,303])
    scatter (KaoSil_30{:,end-1}*100, KaoSil_30{:,end}*100,100,'o','MarkerEdgeColor',Color0,'MarkerFaceColor',Color0,'LineWidth',2)
    hold on

     
    scatter (Low_Turb_30s{:,end-1}*100, Low_Turb_30s{:,end}*100,100,'s','MarkerEdgeColor',Color1,'MarkerFaceColor',Color1)
    scatter (Alum_PNP_30s{:,end-1}*100, Alum_PNP_30s{:,end}*100,100,'d','MarkerEdgeColor',Color4,'MarkerFaceColor',Color4)
    scatter (High_Turb_30s{:,end-1}*100, High_Turb_30s{:,end}*100,100,'>','MarkerEdgeColor',Color2,'MarkerFaceColor',Color2)

    NP= [KaoSil_30{:,end};Alum_PNP_30s{:,end};Low_Turb_30s{:,end};High_Turb_30s{:,end}];
    TSS= [KaoSil_30{:,end-1};Alum_PNP_30s{:,end-1};Low_Turb_30s{:,end-1};High_Turb_30s{:,end-1}];
    

    fprintf('\ncombined\n')
    N=length(NP)
    [param,R2,RMSE]= find_param(TSS,NP)
    
    fprintf('\nkaolinite/silica for alpha = %f\n',param)
    NP=KaoSil_30{:,end};
    TSS=KaoSil_30{:,end-1};
    NP_pred = (1-(1-TSS).^param);
    [R2_kaol,p]=corrcoef(NP,NP_pred);
    R2_kaol=R2_kaol(2)^2
    RMSE_kaol= ((1/length(NP))*sum((NP-(1-(1-TSS).^param)).^2)).^0.5

    plot(5:1:95,(1-(1-[5:1:95]*0.01).^param)*100,'--','Color','k','LineWidth',2)
    text(35,40,strcat('R^{2}= ',string(round(R2,2))),'HorizontalAlignment','right','FontSize',14,'Color','k','FontWeight', 'Bold')

        box on
        ax = gca;

        ax.XAxis.MinorTick = 'on';
        ax.XAxis.MinorTickValues = 10:10:90;
        ax.YAxis.MinorTick = 'on';
        ax.YAxis.MinorTickValues = 10:10:90;
        set(gca,'FontSize',18,'LineWidth',1.5)
        xlim([0,100])
        ylim([0,100])
        yticks(0:20:100)

    text(90,10,'d','HorizontalAlignment','center','FontSize',20,'Color','k','FontWeight', 'Bold')
    hold off
    yticklabels({"",20,40,60,80,100})
    ylabel('Nanoplastic removal (%)','HorizontalAlignment','center');
    xlabel('Total suspended solids removal (%)','HorizontalAlignment','center')
    legend({'28 nm', 'orthokinetic model'},'Location', 'Northwest');
    legend({'49 mg/L (kaolinite/silica)','32 mg/L (silica)', '51 mg/L (silica)','70 mg/L (silica)','orthokinetic model'},'Location', 'Northwest');
    legend boxoff 
    
    %set(gcf,'renderer','Painters')
    %print -depsc -tiff -r300 -painters 'Figures/Matlab Figures/Figure_3d.eps'
%}




% Figure 4

% 4a) Municipal Wastewater - LaPrairie

%{
Color1= '#33aab2';
Color2= '#6eb503';
Color4= '#013463';

 t= figure;
    set(gcf,'Position',[184,402,427,303])
    
    scatter (WWater_LP.TSS*100, WWater_LP.NP*100,100,'s','MarkerEdgeColor','k','MarkerFaceColor',Color2)
    hold on 

    NP= WWater_LP.NP;
    TSS= WWater_LP.TSS;
    [param,R2,RMSE]= find_param(TSS,NP)
    plot(5:1:99,(1-(1-[5:1:99]*0.01).^param)*100,'--','Color',Color4,'LineWidth',2)
    text(92,70,strcat('R^{2}= ',string(round(R2,2))),'HorizontalAlignment','left','FontSize',14,'Color',Color4,'FontWeight', 'Bold')
    txt1=append('RMSE= ',string(round(RMSE,3)*100),'%');
    text(92,65,txt1,'HorizontalAlignment','left','FontSize',14,'Color',Color4,'FontWeight', 'Bold')


    text(98,45,'a','HorizontalAlignment','center','FontSize',20,'Color','k','FontWeight', 'Bold')
        ax=gca;
        ylim([40,100])
        yticks(40:10:100)
        yticklabels({"",50,60,70,80,90,100})
        xlim([80,100])
        xticks(80:5:100)
        xticklabels({80,85,90,95,100})
        ax.YAxis.MinorTick = 'on';
        ax.YAxis.MinorTickValues = 10:10:90;
        box on
        text(WWater_LP.TSS*100,WWater_LP.NP*100+5,string(round(WWater_LP.TSS_mgL,0)),'VerticalAlignment','top','HorizontalAlignment','center','FontSize',14,'Color',Color4,'FontWeight', 'Bold')

    ylabel('Nanoplastic removal (%)','HorizontalAlignment','center');
    xlabel('Total suspended solids removal (%)','HorizontalAlignment','center')
    legend({'28 nm PS in municipal wastewater', 'orthokinetic model'},'Location', 'Southwest');
    set(gca,'FontSize',18,'LineWidth',1.5)
    legend boxoff 

%}

% 4b) Municipal Wastewater - Repentigny

%{
Color1= '#33aab2';
Color2= [0.88,0.29,0.29];
Color4= '#013463';

 t= figure;
    set(gcf,'Position',[184,402,427,303])
    
    scatter (WWater_RP.TSS*100, WWater_RP.NP*100,100,'s','MarkerEdgeColor','k','MarkerFaceColor',Color2)
    hold on 

    NP= WWater_RP.NP;
    TSS= WWater_RP.TSS;
    [param,R2,RMSE]= find_param(TSS,NP)
    plot(5:1:99,(1-(1-[5:1:99]*0.01).^param)*100,'--','Color',Color4,'LineWidth',2)
    text(40,20,strcat('R^{2}= ',string(round(R2,2))),'HorizontalAlignment','left','FontSize',14,'Color',Color4,'FontWeight', 'Bold')
    txt1=append('RMSE= ',string(round(RMSE,3)*100),'%');
    text(40,10,txt1,'HorizontalAlignment','left','FontSize',14,'Color',Color4,'FontWeight', 'Bold')


    text(90,10,'b','HorizontalAlignment','center','FontSize',20,'Color','k','FontWeight', 'Bold')
        ax=gca;
        ylim([0,100])
        %yticks(40:10:100)
        %yticklabels({"",50,60,70,80,90,100})
        xlim([0,100])
        %xticks(80:5:100)
        %xticklabels({80,85,90,95,100})
        ax.YAxis.MinorTick = 'on';
        ax.YAxis.MinorTickValues = 10:10:90;
        box on
        text([82.6,75.1,90.2,64.6,70.5,55],[64.8,80.2,77.3,69.4,52.1,59],string(round(WWater_RP.TSS_mgL,0)),'VerticalAlignment','top','HorizontalAlignment','center','FontSize',14,'Color',Color4,'FontWeight', 'Bold')

    ylabel('Nanoplastic removal (%)','HorizontalAlignment','center');
    xlabel('Total suspended solids removal (%)','HorizontalAlignment','center')
    legend({'250 nm PVC in municipal wastewater', 'orthokinetic model'},'Location', 'Northwest');
    set(gca,'FontSize',18,'LineWidth',1.5)
    legend boxoff 

%}


% 4c) Activated Sludge

%{
Color1= '#33aab2';
Color2= '#6eb503';
Color4= '#013463';

 figure;
    set(gcf,'Position',[184,402,427,303])
    
    scatter (ActSldg.TSS*100, ActSldg.NP*100,100,'s','MarkerEdgeColor','k','MarkerFaceColor',Color1)
    hold on 

    NP= ActSldg.NP;
    TSS= ActSldg.TSS;
    [param,R2,RMSE]= find_param(TSS,NP)
    plot(5:1:99,(1-(1-[5:1:99]*0.01).^param)*100,'--','Color',Color4,'LineWidth',2)
    text(82,50,strcat('R^{2}= ',string(round(R2,2))),'HorizontalAlignment','left','FontSize',14,'Color',Color4,'FontWeight', 'Bold')
    txt1=append('RMSE= ',string(round(RMSE,3)*100),'%');
    text(82,45,txt1,'HorizontalAlignment','left','FontSize',14,'Color',Color4,'FontWeight', 'Bold')


    
        ax=gca;
        ylim([40,100])
        yticks(40:10:100)
        yticklabels({"",50,60,70,80,90,100})
        xlim([80,100])
        xticks(80:5:100)
        xticklabels({80,85,90,95,100})
        ax.YAxis.MinorTick = 'on';
        ax.YAxis.MinorTickValues = 10:10:90;
        box on
        text(ActSldg.TSS*100,ActSldg.NP*100+5,string(round(ActSldg.TSS_mgL,0)),'VerticalAlignment','top','HorizontalAlignment','center','FontSize',14,'Color',Color4,'FontWeight', 'Bold')
        text(98,45,'c','HorizontalAlignment','center','FontSize',20,'Color','k','FontWeight', 'Bold')

    ylabel('Nanoplastic removal (%)','HorizontalAlignment','center');
    xlabel('Total suspended solids removal (%)','HorizontalAlignment','center')
    legend({'28 nm PS in activated sludge water', 'orthokinetic model'},'Location', 'Northwest');
    set(gca,'FontSize',18,'LineWidth',1.5)
    legend boxoff 

%}


% 4d) Aerated Lagoons 

%{
Color1= '#e8ba81';
Color2= '#33aab2';
Color3= '#993710';
Color4= '#013463';

 figure;
    set(gcf,'Position',[184,402,427,303])
    
    scatter (Art_Lag.TSS(Art_Lag.SettlingTime==5)*100, Art_Lag.NP(Art_Lag.SettlingTime==5)*100,100,'MarkerEdgeColor','k','MarkerFaceColor',Color1)
    hold on 
    scatter (Art_Lag.TSS(Art_Lag.SettlingTime==10)*100, Art_Lag.NP(Art_Lag.SettlingTime==10)*100,100,'s','MarkerEdgeColor','k','MarkerFaceColor',Color2)
    scatter (Art_Lag.TSS(Art_Lag.SettlingTime==30)*100, Art_Lag.NP(Art_Lag.SettlingTime==30)*100,100,'^','MarkerEdgeColor','k','MarkerFaceColor',Color3)
    
    
    NP= Art_Lag.NP(Art_Lag.SettlingTime>0);
    TSS= Art_Lag.TSS(Art_Lag.SettlingTime>0);
    [param,R2,RMSE]= find_param(TSS,NP)
    plot(5:1:99,(1-(1-[5:1:99]*0.01).^param)*100,'--','Color',Color4,'LineWidth',2)
    text(65,75,strcat('R^{2}= ',string(round(R2,2))),'HorizontalAlignment','left','FontSize',14,'Color',Color4,'FontWeight', 'Bold')
    txt1=append('RMSE= ',string(round(RMSE,3)*100),'%');
    text(65,65,txt1,'HorizontalAlignment','left','FontSize',14,'Color',Color4,'FontWeight', 'Bold')


    
        ax=gca;
        ylim([0,100])
        %yticks(40:10:100)
        %yticklabels({"",50,60,70,80,90,100})
        xlim([0,100])
        %xticks(80:5:100)
        %xticklabels({80,85,90,95,100})
        ax.YAxis.MinorTick = 'on';
        ax.YAxis.MinorTickValues = 10:10:90;
        box on

    ylabel('Nanoplastic removal (%)','HorizontalAlignment','center');
    xlabel('Total suspended solids removal (%)','HorizontalAlignment','center')
    text(3.5,90,'250 nm PVC in aerated lagoons','FontSize',16.2,'Color','k')
    legend({'5 min', '10 min', '30 min', 'orthokinetic model'},'Location', [0.165,0.531,0.412,0.269]);
    text(90,10,'d','HorizontalAlignment','center','FontSize',20,'Color','k','FontWeight', 'Bold')
    set(gca,'FontSize',18,'LineWidth',1.5)
    legend boxoff 
    hold off

%}


%



% Figure 5

% 5a) Combined Alum data with WW and AS and 5b) Prediction interval
% Alum 30s data for all size NP- 30 s

% {

    Coag= 'ALUM';
    Floc= 'aPAM1';
    rpm = 110;
    ST= 30;
    CoagD= 60;
    Color1='#5f5b7a';
    Color2=[0.4, 0.4, 0.4];
    Color3= [1.00,0.41,0.16];
    Color4= '#6eb503';
    Color5= '#013463';
    Color6= [0.20,0.67,0.70];

    Color7= [0.30,0.75,0.93];
    Color8= [0.89,0.86,0.02];

    Alum_ALL_30s= t(strcmp(t.Coagulant, Coag)& strcmp(t.Flocculant, Floc) ...
        & t.RPM==rpm ...
        &  t.SettlingTime==ST & t.CoagulantDose==CoagD ,:);         %
    fprintf('Number of SWW PS jar tests with alum = %f ',length(Alum_ALL_30s{:,end}))

    figure
        set(gcf,'Position',[184,402,427,427])

             NP_alum = [Alum_ALL_30s{:,end};PVC_30{:,end}];
             TSS_alum = [Alum_ALL_30s{:,end-1};PVC_30{:,end-1}];
             fprintf('Number of SWW PVC jar tests with alum = %f ',length(PVC_30{:,end}))
    
            NP= [NP_alum;WWater_LP.NP;ActSldg.NP;WWater_RP.NP;Art_Lag.NP(Art_Lag.SettlingTime>0)];
            TSS= [TSS_alum;WWater_LP.TSS;ActSldg.TSS;WWater_RP.TSS;Art_Lag.TSS(Art_Lag.SettlingTime>0)];
            x=TSS;
            y=NP;
            Eqn = '(1-(1-x)^a)';
            startPoints=0;
            [fitresult,stat_data] = fit(x,y,Eqn,'Start', startPoints)
            param= fitresult.a;
            R2=stat_data.rsquare
            N=length(NP)
            NP_pred = (1-(1-TSS).^param);
            [R,p]=corrcoef(NP,NP_pred);
            p(2)
            plot(5:1:95,(1-(1-[5:1:95]*0.01).^param)*100,'--','Color','k','LineWidth',2)
            hold on
            text(10,70,strcat('R^{2}= ',string(round(R2,2))),'HorizontalAlignment','left','FontSize',16,'Color','k','FontWeight', 'Bold')
            [param,R2,RMSE]= find_param(TSS,NP)
            txt1=append('RMSE= ',string(round(RMSE,3)*100),'%');
            text(10,60,txt1,'HorizontalAlignment','left','FontSize',16,'Color','k','FontWeight', 'Bold')

            p11 = predint(fitresult,x,0.95,'observation','off');
            P11=sort([x,p11],1);
    
                Low_error= P11(:,2)*100;
                Upper_error= P11(:,3)*100;
                inBetween = [Low_error', fliplr(Upper_error')];
                x2 = [P11(:,1)'*100, fliplr(P11(:,1)'*100)];
                fill(x2, inBetween, [0.80,0.80,0.80],'FaceAlpha',.3);

        scatter (Alum_ALL_30s{:,end-1}*100, Alum_ALL_30s{:,end}*100,50,'MarkerEdgeColor','k','MarkerFaceColor',Color1)
        scatter (PVC_30{:,end-1}*100, PVC_30{:,end}*100,50,'MarkerEdgeColor','k','MarkerFaceColor',[0.68,0.68,0.68])
        scatter (WWater_LP.TSS*100, WWater_LP.NP*100,150,'s','MarkerEdgeColor','k','MarkerFaceColor',Color4)
                scatter (WWater_RP.TSS*100, WWater_RP.NP*100,150,'diamond','MarkerEdgeColor','k','MarkerFaceColor',Color7)
        scatter (ActSldg.TSS*100, ActSldg.NP*100,150,'^','MarkerEdgeColor','k','MarkerFaceColor',Color3)
        scatter (Art_Lag.TSS(Art_Lag.SettlingTime>0)*100, Art_Lag.NP(Art_Lag.SettlingTime>0)*100,150,'>','MarkerEdgeColor','k','MarkerFaceColor',Color8)

        box on
        set(gca,'FontSize',18,'LineWidth',1.5, 'OuterPosition',[-0.000197756289189,0.169555035128806,0.996118433179723,0.810625131831633],'InnerPosition',[0.146898478582761,0.290339724688834,0.754390947155699,0.629043557384233],'Position',[0.146898478582761,0.290339724688834,0.754390947155699,0.629043557384233])
        xlim([0,100])
        ylim([0,100])
        yticks(0:20:100)

  


        text(90,10,'a','HorizontalAlignment','center','FontSize',20,'Color','k','FontWeight', 'Bold')
        hold off
        yticklabels({"",20,40,60,80,100})
        ylabel('Nanoplastic removal (%)','HorizontalAlignment','center');
        xlabel('Total suspended solids removal (%)','HorizontalAlignment','center')
        %legend({'synthetic wastewater','real wastewater LP',sprintf('activated sludge\ntreated water'),'real wastewater RP',sprintf('aerated lagoons\ntreated water')},'Location', 'Northwest');
        %legend({'synthetic wastewater','real wastewater LP','activated sludge','real wastewater RP','aerated lagoons'},'Location', 'Northwest');
        
        %legend({'','','synthetic WW (PS)','synthetic WW (PVC)','municipal WW LP (PS)','municipal WW RP (PVC)','activated sludge LP (PS)','aerated lagoons RP (PVC)'},'Location', 'southoutside','NumColumns',2,'position',[-0.0158,0.0632,1.0129,0.149]);
        %legend({'','','synthetic WW (PS)','synthetic WW (PVC)','municipal WW1 (PS)','municipal WW2 (PVC)','activated sludge (PS)','aerated lagoons (PVC)'},'Location', 'southoutside','NumColumns',2,'position',[-0.0158,0.0632,1.0129,0.149]);

        %{
            [~, objh] = legend({'','','synthetic WW (PS)','synthetic WW (PVC)','municipal WW1 (PS)','municipal WW2 (PVC)','activated sludge (PS)','aerated lagoons (PVC)'},'Location', 'southoutside','NumColumns',2,'position',[-0.0158,0.0632,1.0129,0.149]);
            %// set font size as desired
            objhl = findobj(objh, 'type', 'patch'); %// objects of legend of type line
            set(objhl, 'Markersize', 10); %// set marker size as desired
        %}
        %legend boxoff
        %set(gcf,'renderer','Painters')
        %print -depsc -tiff -r300 -painters Fig_5a.eps


 % 5b) Prediction interval       

% https://www.datasci.org/curvefit/confidence-and-prediction-bounds.html
% If you are predicting a new observation, nonsimultaneous bounds measure the confidence that the new observation lies within the interval given a single predictor value.
% Prediction bound on fits



figure
        set(gcf,'Position',[184,402,427,427])
        initial_Turb= [50:1:250];
        initial_Turb_removal= (initial_Turb-25)./initial_Turb;


        Low_error= P11(:,2)*100;
        Upper_error= P11(:,3)*100;
        inBetween = [Low_error', fliplr(Upper_error')];
        x2 = [25./(1-P11(:,1)'), fliplr(25./(1-P11(:,1)'))];
        fill(x2, inBetween, Color6,'FaceAlpha',.3);
        Predict_NP_removal=[25./(1-P11(:,1)),(1-(1-P11(:,1)).^param)*100,P11(:,2)*100,P11(:,3)*100]; % Table showing initial concentration of TSS with mean, upper limit, lower limit of removal

        hold on
        plot (initial_Turb,(1-(1-initial_Turb_removal).^param)*100,'--','Color',[0.45,0.13,0.38],'LineWidth',2)
        text(175,30,{'To achieve regulatory limit of'; '25 mg/L TSS after treatment'},'HorizontalAlignment','center','FontSize',16,'Color','k')
        
        
        box on
        set(gca,'FontSize',18,'LineWidth',1.5)
        xlim([50,250])
        ylim([0,100])
        yticks(0:20:100)

        text(50+200*0.9,10,'b','HorizontalAlignment','center','FontSize',20,'Color','k','FontWeight', 'Bold')
        hold off
        yticklabels({"",20,40,60,80,100})
        ylabel({'Predicted nanoplastic', 'removal (%)'},'HorizontalAlignment','center');
        xlabel({'Initial concentration of TSS (mg/L)'},'HorizontalAlignment','center')
        
        %set(gcf,'renderer','Painters')
        %print -depsc -tiff -r300 -painters Fig_5b.eps

        in_Turb=60;
        removal= 1-(1-(in_Turb-25)/in_Turb).^param;
        fprintf('NP removal for initial concentration of %d = %f\n', in_Turb, removal)

        in_Turb=200;
        removal= 1-(1-(in_Turb-25)/in_Turb).^param;
        fprintf('NP removal for initial concentration of %d = %f\n', in_Turb, removal)

%}

%}

% Figure 6 
% 6a) Microplastics and microfibers in synthetic wastewater jar test
%{
    Color1= '#a56879';
    Color2= '#a09c51';
    Color3 = '#5f5b7a';
    Color4 = '#2b9eb3';
    
    figure
    set(gcf,'Position',[184,402,427,303])
    scatter (Microfiber{:,end-1}*100, Microfiber{:,end}*100,100,'d','MarkerEdgeColor','k','MarkerFaceColor',Color1)
    hold on
    scatter (Microplastic{:,end-1}*100, Microplastic{:,end}*100,100,'s','MarkerEdgeColor','k','MarkerFaceColor',Color2)
    %scatter (Microfragment{:,end-1}*100, Microfragment{:,end}*100,100,'^','MarkerEdgeColor','k','MarkerFaceColor',Color4)
        box on
        ax = gca;
        ax.XAxis.MinorTick = 'on';
        ax.XAxis.MinorTickValues = 10:10:90;
        ax.YAxis.MinorTick = 'on';
        ax.YAxis.MinorTickValues = 10:10:90;
        set(gca,'FontSize',18,'LineWidth',1.5)
        xlim([0,100])
        ylim([0,100])
        yticks(0:20:100)

    TSS_lim= 0.7;
    N=length(Microfiber{:,end}(Microfiber{:,end-1}>TSS_lim))
    mean(Microfiber{:,end}(Microfiber{:,end-1}>TSS_lim))
    std(Microfiber{:,end}(Microfiber{:,end-1}>TSS_lim))

    N=length(Microplastic{:,end}(Microplastic{:,end-1}>TSS_lim))
    mean(Microplastic{:,end}(Microplastic{:,end-1}>TSS_lim))
    std(Microplastic{:,end}(Microplastic{:,end-1}>TSS_lim))

    N=length(Microfragment{:,end}(Microfragment{:,end-1}>TSS_lim))
    mean(Microfragment{:,end}(Microfragment{:,end-1}>TSS_lim))
    std(Microfragment{:,end}(Microfragment{:,end-1}>TSS_lim))

    text(10,10,'a','HorizontalAlignment','center','FontSize',20,'Color','k','FontWeight', 'Bold')
    text(60,40,sprintf('synthetic\nwastewater'),'HorizontalAlignment','left','FontSize',20,'Color','k','FontWeight', 'Bold')       
    hold off
    yticklabels({"",20,40,60,80,100})
    ylabel('Microplastic removal (%)','HorizontalAlignment','center','Color','k');
    xlabel('Total suspended solids removal (%)','HorizontalAlignment','center','Color','k')
    [~, objh] = legend({'PEST microfiber','PE microsphere',''},'Location', 'Southeast');
            %// set font size as desired
            objhl = findobj(objh, 'type', 'patch'); %// objects of legend of type line
            set(objhl, 'Markersize', 10); %// set marker size as desired
        
    legend boxoff 


%}


% 6b) Pilot Scale with synthetic wastewater

%{    

% Flocculation time
    Color= {'#5f5b7a';'#a56879';'#a09c51'};
    
    t=[30,60,180,600,1200];
    MF_avg=zeros(2,length(t));
    MS_avg=zeros(2,length(t));
    for i=1:length(t);
    PP= Pilot_Plant(Pilot_Plant.SettlingTime==t(i),:);

        TSS_avg(1,i) = mean(PP.TSS);
        TSS_avg(2,i) = std(PP.TSS);    
        MF_avg(1,i) = mean(PP.MF);
        MF_avg(2,i) = std(PP.MF);
        MS_avg(1,i) = mean(PP.MS);
        MS_avg(2,i) = std(PP.MS);
    end

    figure

    set(gcf,'Position',[184,402,427,303])
    h(1)=semilogx(t, MF_avg(1,:)*100,'d','MarkerSize', 10,'MarkerEdgeColor',Color{2},'MarkerFaceColor',Color{2},'LineStyle','--','LineWidth',2,'Color',Color{2});
    hold on
    h(2)=semilogx(t, MS_avg(1,:)*100,'s','MarkerSize', 10,'MarkerEdgeColor',Color{3},'MarkerFaceColor',Color{3},'LineStyle','--','LineWidth',2,'Color',Color{3});
    h(3)= plot(t,TSS_avg(1,:)*100,'o','MarkerSize', 7,'MarkerEdgeColor',Color{1},'MarkerFaceColor',Color{1},'LineStyle','--','LineWidth',2,'Color',Color{1});
    
    rectangle('Position',[500 0.1 2000 99.9], 'FaceColor',[0.7, 0.9, 0.9, 0.6],'EdgeColor',[0.7, 0.9, 0.9, 0.6],'LineWidth',0.01)

    er1=errorbar(t, MF_avg(1,:)*100,MF_avg(2,:)*100,MF_avg(2,:)*100);
        er1.Color = Color{2};                            
        er1.LineStyle = 'none'; 
        er1.LineWidth = 2;
    er2=errorbar(t, MS_avg(1,:)*100,MS_avg(2,:)*100,MS_avg(2,:)*100);
        er2.Color = Color{3};                            
        er2.LineStyle = 'none'; 
        er2.LineWidth = 2;
    er3=errorbar(t, TSS_avg(1,:)*100,TSS_avg(2,:)*100,TSS_avg(2,:)*100);
        er3.Color = Color{1};                            
        er3.LineStyle = 'none'; 
        er3.LineWidth = 2;
        alpha= 0.65;
        set([er3.Bar, er3.Line], 'ColorType', 'truecoloralpha', 'ColorData', [er3.Line.ColorData(1:3); 255*alpha])
        set(er3.Cap, 'EdgeColorType', 'truecoloralpha', 'EdgeColorData', [er3.Cap.EdgeColorData(1:3); 255*alpha])

    uistack(h(3), 'top');
    uistack(h(1),'top');
    uistack(h(2),'top');    
           
        box on
        set(gca,'FontSize',18,'LineWidth',1.5)
        ax = gca;
        ax.YAxis.MinorTick = 'on';
        ax.YAxis.MinorTickValues = 10:10:90;
        ylim([0,100])
        yticks(0:20:100)
        xlim([20,2000])

    yticklabels({"",20,40,60,80,100})
    a=[10:20:30,100:200:300,1000:2000:3000,10000];
    xticks(a)
    xticklabels(a)
    ylabel('Removal (%)','HorizontalAlignment','center');
    xlabel('Settling time (s)','HorizontalAlignment','center')
    legend({'','','','TSS','microfiber','microsphere'},'Position', [0.361,0.203,0.308,0.2046]);
    legend boxoff 
    text(1000,10,'b','HorizontalAlignment','center','FontSize',20,'Color','k','FontWeight', 'Bold')
    text(600,40,sprintf('pilot\nscale'),'HorizontalAlignment','left','FontSize',20,'Color','k','FontWeight', 'Bold') 

 
%}


% 6c) Bar graph comparing microfiber and microplastic in synthetic
% wastewater (jar test), synthetic waster (pilot scale) and municipal
% wastewater (jar test)
%{

% SWW
    Color= {'#60e06d';'#6d60e0';'#e06d60'};
    Color= {'#0e0182';'#82015b';'#288201'};
    Color= {'#c087a9';'#ae5433';'#6d9858';[0.02,0.35,0.56]};
    Color= {'#c087a9';[0.73,0.20,0.02];'#6d9858';[0.20,0.55,0.70]};



    TSS_lim= 0.70;
    SWW_MF= Microfiber(Microfiber{:,end-1}>TSS_lim,:);
    SWW_MS = Microplastic(Microplastic{:,end-1}>TSS_lim,:);

    t=180;
    PP=Pilot_Plant(Pilot_Plant.SettlingTime==t,:);
    PP={PP.TSS*100;PP.MF*100;PP.MS*100};

    WW_LP = {WWater_LP.TSS*100, WWater_LP.MF*100,WWater_LP.MS(WWater_LP.MS>0)*100};
    
    WW_RP = {WWater_RP.TSS(WWater_LP.MF>0)*100, WWater_RP.MF(WWater_RP.MF>0)*100, WWater_RP.MS(WWater_RP.MF>0)*100};

    data_MF= {SWW_MF{:,end}*100;PP{2};WW_LP{2};WW_RP{2}};
    data_MS= {SWW_MS{:,end}*100;PP{3};WW_LP{3};WW_RP{3}};

    data_WW_RP={WW_RP{2},WW_RP{3}};
    data_WW_LP={WW_LP{2},WW_LP{3}};
    data_SWW={SWW_MF{:,end}*100,SWW_MS{:,end}*100};
    data_PP = {PP{2},PP{3}};
    
    p_test_MF=zeros(4,4);
    p_test_MS=zeros(4,4);
    type_test_MF=zeros(4,4);
    type_test_MS=zeros(4,4);
    for i=1:4
          for j=1:4
              [type_MF, h,p_MF]= stat_test(data_MF{i},data_MF{j});
              [type_MS, h,p_MS]= stat_test(data_MS{i},data_MS{j}); 
              p_test_MF(i,j) = p_MF;
              p_test_MS(i,j) = p_MS;
              if strlength(type_MF)==7;t=0;elseif strlength(type_MF)==5;t=1;end
              type_test_MF(i,j)= t;
              if strlength(type_MS)==7;t=0;elseif strlength(type_MS)==5;t=1;end
              type_test_MS(i,j)= t;
          end
    end
    p_test_MF
    p_test_MS
    type_test_MF
    type_test_MS

index = [1,2];

    figure
    set(gcf,'Position',[184,250,427,455])
    
    avger= [mean(data_SWW{1}),mean(data_SWW{2});mean(data_PP{1}),mean(data_PP{2});mean(data_WW_LP{1}),mean(data_WW_LP{2});mean(data_WW_RP{1}),mean(data_WW_RP{2})];
    stdev= [std(data_SWW{1}),std(data_SWW{2});std(data_PP{1}),std(data_PP{2});std(data_WW_LP{1}),std(data_WW_LP{2});std(data_WW_RP{1}),std(data_WW_RP{2})];

        lim=60;
        b=bar([1,2],avger,'barwidth',0.9);  
        hold on
        b(1).FaceColor = Color{1};
        b(2).FaceColor = Color{2};
        b(3).FaceColor = Color{3};
        b(4).FaceColor = Color{4};


        for i = 1:length(index)
        ds1=0.09;
        ds2=0.27;
        txt1=append(string(round(avger(i*4-3),0)),'%');
        txt2=append(string(round(avger(i*4-2),0)),'%');
        txt3=append(string(round(avger(i*4-1),0)),'%');
        txt4=append(string(round(avger(i*4),0)),'%');
            in=index(i)-ds2;av=avger(i*4-3);stad=stdev(i*4-3);
            textsize= 13;
            text(in,lim+5,txt1,'HorizontalAlignment','center','FontSize',textsize,'Color','white','FontWeight', 'Bold')
            er1 = errorbar(in,av,stad,stad);
                        er1.Color = [0 0 0];
                        er1.LineStyle = 'none'; 
                        er1.LineWidth = 2;
                        alpha = 0.65;
                        set([er1.Bar, er1.Line], 'ColorType', 'truecoloralpha', 'ColorData', [er1.Line.ColorData(1:3); 255*alpha])
                        set(er1.Cap, 'EdgeColorType', 'truecoloralpha', 'EdgeColorData', [er1.Cap.EdgeColorData(1:3); 255*alpha])
            scatter (in,data_SWW{i},100,'x','MarkerEdgeColor','k','MarkerFaceColor','k','MarkerFaceAlpha',1,'LineWidth',1)
            
            in=index(i)-ds1;av=avger(i*4-2);stad=stdev(i*4-2);
            text(in,lim+5,txt2,'HorizontalAlignment','center','FontSize',textsize,'Color','white','FontWeight', 'Bold')
            er1 = errorbar(in,av,stad,stad);
                        er1.Color = [0 0 0];                            
                        er1.LineStyle = 'none'; 
                        er1.LineWidth = 2;
                        set([er1.Bar, er1.Line], 'ColorType', 'truecoloralpha', 'ColorData', [er1.Line.ColorData(1:3); 255*alpha])
                        set(er1.Cap, 'EdgeColorType', 'truecoloralpha', 'EdgeColorData', [er1.Cap.EdgeColorData(1:3); 255*alpha])
            scatter (in,data_PP{i},100,'x','MarkerEdgeColor','k','MarkerFaceColor','k','MarkerFaceAlpha',1,'LineWidth',1)
            
            in=index(i)+ds1;av=avger(i*4-1);stad=stdev(i*4-1);
            text(in,lim+5,txt3,'HorizontalAlignment','center','FontSize',textsize,'Color','white','FontWeight', 'Bold')
            er1 = errorbar(in,av,stad,stad);
                        er1.Color = [0 0 0];                            
                        er1.LineStyle = 'none'; 
                        er1.LineWidth = 2;   
                        set([er1.Bar, er1.Line], 'ColorType', 'truecoloralpha', 'ColorData', [er1.Line.ColorData(1:3); 255*alpha])
                        set(er1.Cap, 'EdgeColorType', 'truecoloralpha', 'EdgeColorData', [er1.Cap.EdgeColorData(1:3); 255*alpha])
            scatter (in,data_WW_LP{i},100,'x','MarkerEdgeColor','k','MarkerFaceColor','k','MarkerFaceAlpha',1,'LineWidth',1)

            in=index(i)+ds2;av=avger(i*4);stad=stdev(i*4);
            text(in,lim+5,txt4,'HorizontalAlignment','center','FontSize',textsize,'Color','white','FontWeight', 'Bold')
            er1 = errorbar(in,av,stad,stad);
                        er1.Color = [0 0 0];                            
                        er1.LineStyle = 'none'; 
                        er1.LineWidth = 2;   
                        set([er1.Bar, er1.Line], 'ColorType', 'truecoloralpha', 'ColorData', [er1.Line.ColorData(1:3); 255*alpha])
                        set(er1.Cap, 'EdgeColorType', 'truecoloralpha', 'EdgeColorData', [er1.Cap.EdgeColorData(1:3); 255*alpha])
            scatter (in,data_WW_RP{i},100,'x','MarkerEdgeColor','k','MarkerFaceColor','k','MarkerFaceAlpha',1,'LineWidth',1)


        end

        
        
        hold off
                
        xlim([0.6,2.4]);
        xticks(index)
        xticklabels({'microfiber','microsphere'})
        set(gca, 'Ticklength', [0 0])
        xtickangle(0)
            ax=gca;
            set(gca,'FontSize',18,'LineWidth',1.5)
       

       ylim([lim,100])
       ax.YAxis.MinorTick = 'on';
       ax.YAxis.MinorTickValues = 80:2.5:97.5;
       yticks(lim:5:100)
       text(0.6+0.9*(2.4-0.6),lim+0.95*(100-lim),'c','HorizontalAlignment','center','FontSize',20,'Color','k','FontWeight', 'Bold')       

            
        ylabel('Microplastic removal (%)');
        set(gca,'FontSize',18)
        box on
        legend({'SWW (jar test)','SWW (pilot scale)','MWW LaPrairie (jar test)','MWW Repentigny (jar test)'},'Location','southoutside','Orientation','vertical','NumColumns',2)
        legend boxoff

%}


% 6d) Microfragments in SWW

%{

    Color3 = '#5f5b7a';
    Color2 = [0.86,0.84,0.40];
    Color4 = '#2b9eb3';
    
    figure
    set(gcf,'Position',[601,351,427,243])
    scatter (Microfragment{:,end-1}*100, Microfragment{:,end}*100,100,'^','MarkerEdgeColor','k','MarkerFaceColor',Color4)
    hold on
    scatter (WWater_RP.TSS(WWater_RP.HDPE>0)*100, WWater_RP.HDPE(WWater_RP.HDPE>0)*100,200,'pentagram','MarkerEdgeColor','k','MarkerFaceColor',Color2)
        box on
        ax = gca;
        ax.XAxis.MinorTick = 'on';
        ax.XAxis.MinorTickValues = 10:10:90;
        ax.YAxis.MinorTick = 'on';
        ax.YAxis.MinorTickValues = 10:10:90;
        set(gca,'FontSize',18,'LineWidth',1.5)
        xlim([0,100])
        ylim([0,100])
        yticks(0:20:100)

    TSS_lim= 0.7;
    N=length(Microfragment{:,end}(Microfragment{:,end-1}>TSS_lim));
    mean(Microfragment{:,end}(Microfragment{:,end-1}>TSS_lim));
    std(Microfragment{:,end}(Microfragment{:,end-1}>TSS_lim));

    TSS_lim= 0.65;
    [R2,p]=corrcoef(Microfragment{:,end}(Microfragment{:,end-1}<TSS_lim),Microfragment{:,end-1}(Microfragment{:,end-1}<TSS_lim));
    R2=R2(2)^2;


    fprintf('MWW\n')
    N=length(WWater_RP.HDPE(WWater_RP.HDPE>0))
    mean(WWater_RP.HDPE(WWater_RP.HDPE>0))
    std(WWater_RP.HDPE(WWater_RP.HDPE>0))
    
    TSS_lim_low= 0.77;
    TSS_lim_high= 0.83;
    fprintf('SWW with TSS between %f and %f\n',TSS_lim_low, TSS_lim_high)
    microfrag=Microfragment{:,end}(Microfragment{:,end-1}>TSS_lim_low & Microfragment{:,end-1}<TSS_lim_high);
    microfrag_TSS=Microfragment{:,end-1}(Microfragment{:,end-1}>TSS_lim_low & Microfragment{:,end-1}<TSS_lim_high);
    N=length(microfrag)
    mean_micro=mean(microfrag)
    std_micro=std(microfrag)
    mean_TSS=mean(microfrag_TSS)
    std_TSS=std(microfrag_TSS)
    
    [a,b,p]=stat_test(WWater_RP.HDPE(WWater_RP.HDPE>0),microfrag)

    text(10,90,'d','HorizontalAlignment','center','FontSize',20,'Color','k','FontWeight', 'Bold')
    hold off
    yticklabels({"",20,40,60,80,100})
    label_y='HDPE microfragments\n removal (%)';
    ylabel(sprintf(string(label_y)),'HorizontalAlignment','center','Color','k');
    xlabel('Total suspended solids removal (%)','HorizontalAlignment','center','Color','k')
    [~, objh] = legend({'synthetic WW','municipal WW2'},'Location', 'southeast');
            %// set font size as desired
            objhl = findobj(objh, 'type', 'patch'); %// objects of legend of type line
            set(objhl, 'Markersize', 10); %// set marker size as desired
        
    legend boxoff 
%}

% Supplementary Information


% SI) Orthokinetic/ Perikinetic

%{

    Color1= '#5f5b7a';
    Color2= [0.8500 0.3250 0.0980];
    Color3= '#e8ba81';



G = 200;        % s^-1 
T = 298;        % K  
mu =0.89E-3;    % Ns/m2
k=1.380649E-23;     % J/k
d1= [28E-9,50E-9,220E-9];          % m

d2 = 1E-6*10.^[-2:0.05:3];
K_peri = zeros(length(d1),length(d2));
K_ortho = zeros(length(d1),length(d2));

for j = 1:length(d1)
    for i = 1:length(d2)
    K_peri(j,i)  =((2*k*T)/(3*mu))*((d1(j)+d2(i))^2)/(d1(j)*d2(i));
    K_ortho(j,i) = (G/6)*(d1(j)+d2(i))^3;
    end
end


set(gcf,'Position',[184,402,427,303])

loglog(d2*1E6,ones(1,length(d2)),'--','Color','k','LineWidth',2)
hold on
plot(d2*1E6,K_ortho(1,:)./K_peri(1,:),'Color',Color1,'LineWidth',3)
plot(d2*1E6,K_ortho(2,:)./K_peri(2,:),'Color',Color2,'LineWidth',3)
plot(d2*1E6,K_ortho(3,:)./K_peri(3,:),'Color',Color3,'LineWidth',3)
            
            box on
            ax = gca;
            ax.YAxis.MinorTick = 'off';
            ax.XAxis.MinorTick = 'on';
            set(gca, 'YGrid', 'off', 'XGrid', 'on')

    ylabel('k_{orthokinetic}/k_{perikinetic}','HorizontalAlignment','center');
    xlabel('Size of d_{j} particles (\mum)','HorizontalAlignment','center')
    xticklabels({'0.01','0.1','1','10','100','1000'})
    yticklabels({'10^{-4}','10^{-2}','1','10^{2}','10^{4}','10^{6}'})
    legend({'','28 nm','50 nm','220 nm'},'Location', 'Northwest');
    legend
    set(gca,'FontSize',18,'LineWidth',1.5)
    xlim([0.01,1000])
    ylim([1E-4,1E6])
    legend boxoff 
%}


% S2) Floc Size
    
%{
    file1= strcat('Processed Data/aPAM1_flocsize.csv');
    fid1 = fopen(file1,'r');
    A = textscan(fid1, '%f', 'Delimiter',',');

    figure
        set(gcf,'Position',[212,302,980,405])
        subplot(1,2,1)
        [N1, e1]= histcounts(A{1});                
    
        Pl1= histogram(A{1},10);
        Pl1(1).FaceColor = [0 0.4470 0.7410];
    
        hold on
        text(0.9*1500,0.9*30,'a','HorizontalAlignment','center','FontSize',20,'Color','k','FontWeight', 'Bold')
        hold off
        axis([0,1500,0,30])
        xticks(0:300:1500)
        xlabel('Size (\mum)');
        ylabel('Count');
        set(gca,'FontSize',16)
    
        subplot(1,2,2)
        dx=0.1;
    
        plot (7*ones(length(A{1}),1),A{1},'x','MarkerFaceColor',[0 0.4470 0.7410],'MarkerSize',15);
        hold on
        line([7-dx,7+dx],[mean(A{1}),mean(A{1})],'Color',[0 0.4470 0.7410],'LineWidth',2)
        line([7-dx,7+dx],[median(A{1}),median(A{1})],'Color',[0 0.4470 0.7410],'LineWidth',2,'LineStyle',':')
        text(6.7+0.9*(7.3-6.7),0.9*1500,'b','HorizontalAlignment','center','FontSize',20,'Color','k','FontWeight', 'Bold')
        hold off
        
        axis([6.7,7.3,0,max(A{1})])
        yticks(0:150:1500)
        set(gca,'xtick',[]);
        ylabel('Size (\mum)');
        xlabel('Flocculant (aPAM1)');
        xticklabels({''})
        set(gca,'FontSize',16)

%}


% S3) Surface functionalization
% {

% Figure 3a
Color1= '#e8ba81';
Color2= '#33aab2';
Color3= '#993710';
Color4= '#013463';
Color5= '#752414';
Color6= [0.50,0.41,0.56];
Color0= [0.51,0.20,0.71];

 figure
    set(gcf,'Position',[184,402,750,303])
    scatter (Alum_220_ANP_30s{:,end-1}*100, Alum_220_ANP_30s{:,end}*100,100,'s','MarkerEdgeColor',Color3,'MarkerFaceColor',Color3)
    hold on
    scatter (PVC_30{:,end-1}*100, PVC_30{:,end}*100,100,'o','MarkerEdgeColor',Color0,'MarkerFaceColor',Color0,'LineWidth',2)
 
        box on
        ax = gca;

        ax.XAxis.MinorTick = 'on';
        ax.XAxis.MinorTickValues = 10:10:90;
        ax.YAxis.MinorTick = 'on';
        ax.YAxis.MinorTickValues = 10:10:90;
        set(gca,'FontSize',18,'LineWidth',1.5)
        xlim([0,100])
        ylim([0,100])
        yticks(0:20:100)

    NP= [Alum_220_ANP_30s{:,end}];
    TSS= [Alum_220_ANP_30s{:,end-1}];
    fprintf('Stats for 220 nm aged PS')
    N=length(NP)
    [param,R2,RMSE]= find_param(TSS,NP)
    plot(5:1:95,(1-(1-[5:1:95]*0.01).^param)*100,'--','Color',Color3,'LineWidth',2)
    text(92,45,strcat('R^{2}= ',string(round(R2,2))),'HorizontalAlignment','right','FontSize',14,'Color',Color3,'FontWeight', 'Bold')

    NP= [PVC_30{:,end}];
    TSS= [PVC_30{:,end-1}];
    fprintf('Stats for 250 nm PVC')
    N=length(NP)
    [param,R2,RMSE]= find_param(TSS,NP)
    plot(5:1:95,(1-(1-[5:1:95]*0.01).^param)*100,':','Color',Color0,'LineWidth',2)
    text(70,65,strcat('R^{2}= ',string(round(R2,2))),'HorizontalAlignment','right','FontSize',14,'Color',Color0,'FontWeight', 'Bold')


    text(90,10,'a','HorizontalAlignment','center','FontSize',20,'Color','k','FontWeight', 'Bold')
    hold off
    yticklabels({"",20,40,60,80,100})
    ylabel('Nanoplastic removal (%)','HorizontalAlignment','center');
    xlabel('Total suspended solids removal (%)','HorizontalAlignment','center')
    legend({'220 nm PS (-COOH; aged)','250 nm PVC (-none; pristine)', 'PS orthokinetic model','PVC orthokinetic model'},'Location', 'Northwest');

    legend boxoff 


% Figure 3b
% {
 figure
    set(gcf,'Position',[184,402,750,303])
    scatter (Alum_50_ANP_30s{:,end-1}*100, Alum_50_ANP_30s{:,end}*100,100,'s','MarkerEdgeColor',Color1,'MarkerFaceColor',Color1)
    hold on
    scatter (Alum_50_PNP_pt1_30s{:,end-1}*100, Alum_50_PNP_pt1_30s{:,end}*100,100,'^','MarkerEdgeColor',Color5,'MarkerFaceColor',Color5)
    scatter (Alum_ANP_Nonfunc_30s{:,end-1}*100, Alum_ANP_Nonfunc_30s{:,end}*100,100,'s','MarkerEdgeColor',Color2,'MarkerFaceColor',Color2)
    %scatter (Alum_220_ANP_30s{:,end-1}*100, Alum_220_ANP_30s{:,end}*100,100,'s','MarkerEdgeColor',Color3,'MarkerFaceColor',Color3)
    scatter (PVC_30{:,end-1}*100, PVC_30{:,end}*100,100,'o','MarkerEdgeColor',Color0,'MarkerFaceColor',Color0,'LineWidth',2)

        box on
        ax = gca;
        ax.XAxis.MinorTick = 'on';
        ax.XAxis.MinorTickValues = 10:10:90;
        ax.YAxis.MinorTick = 'on';
        ax.YAxis.MinorTickValues = 10:10:90;
        set(gca,'FontSize',18,'LineWidth',1.5)
        xlim([0,100])
        ylim([0,100])
        yticks(0:20:100)

            NP= [Alum_50_ANP_30s{:,end}];
            TSS= [Alum_50_ANP_30s{:,end-1}];
            fprintf('Stats for 50 nm aged PS-COOH 1.4 ppm')
            N=length(NP)
            [param,R2,RMSE]= find_param(TSS,NP)
            plot(5:1:95,(1-(1-[5:1:95]*0.01).^param)*100,'--','Color','k','LineWidth',2)
            plot(5:1:95,(1-(1-[5:1:95]*0.01).^param)*100,'--','Color',Color1,'LineWidth',2)
            text(92,54,strcat('R^{2}= ',string(round(R2,2))),'HorizontalAlignment','right','FontSize',14,'Color',Color1,'FontWeight', 'Bold')

        
            NP= [Alum_50_PNP_pt1_30s{:,end}];
            TSS= [Alum_50_PNP_pt1_30s{:,end-1}];
            fprintf('Stats for 50 nm pristine PS-COOH 0.08 ppm')
            N=length(NP)
            [param,R2,RMSE]= find_param(TSS,NP)
            plot(5:1:95,(1-(1-[5:1:95]*0.01).^param)*100,'--','Color',Color5,'LineWidth',2)
            text(84,80,strcat('R^{2}= ',string(round(R2,2))),'HorizontalAlignment','right','FontSize',14,'Color',Color5,'FontWeight', 'Bold')

            NP= [Alum_ANP_Nonfunc_30s{:,end}];
            TSS= [Alum_ANP_Nonfunc_30s{:,end-1}];
            fprintf('Stats for 50 nm pristine PS-none 1.4 ppm')
            N=length(NP)
            [param,R2,RMSE]= find_param(TSS,NP)
            plot(5:1:95,(1-(1-[5:1:95]*0.01).^param)*100,'--','Color',Color2,'LineWidth',2)
            text(70,66,strcat('R^{2}= ',string(round(R2,2))),'HorizontalAlignment','right','FontSize',14,'Color',Color2,'FontWeight', 'Bold')

            NP= [PVC_30{:,end}];
            TSS= [PVC_30{:,end-1}];
            fprintf('Stats for 250 nm pristine PVC-none 0.8 ppm')
            N=length(NP)
            [param,R2,RMSE]= find_param(TSS,NP)
            plot(5:1:95,(1-(1-[5:1:95]*0.01).^param)*100,':','Color',Color0,'LineWidth',2)
            text(82,23,strcat('R^{2}= ',string(round(R2,2))),'HorizontalAlignment','right','FontSize',14,'Color',Color0,'FontWeight', 'Bold')


        
        
            text(90,10,'b','HorizontalAlignment','center','FontSize',20,'Color','k','FontWeight', 'Bold')
            hold off
            yticklabels({"",20,40,60,80,100})
            ylabel('Nanoplastic removal (%)','HorizontalAlignment','center');
            xlabel('Total suspended solids removal (%)','HorizontalAlignment','center')
            legend({'50 nm PS (COOH; aged; 1.4 ppm)','50 nm PS (COOH; pristine; 0.08 ppm)','50 nm PS (none; aged; 1.4 ppm)','250 nm PVC (none; pristine; 0.8 ppm)', 'PS orthokinetic models','','','','PVC orthokinetic model'},'Location', 'Northwest');
            legend boxoff 

% }
%}

% S5) MWW and Activated Sludge

%{
 Color1 = [0, 0.5, 0];
    
    % Pristine; 28 nm PS; MWW- LP- Initial 
    TSS_WW = [280.7 21.0 26.3 40.3 49.7];
    TSS_WW_std = [12.9 1.0 2.5 4.7 5.9];
    Conc_1 = [0 5.45 3.633333333 1.816666667 0.908333333];

    % Pristine; 250 nm PVC; MWW- RP- Initial 
    TSS_WW_RP = [156.7 83.0 67.0 49.0 28.0];
    TSS_WW_RP_std = [11.0 6.1 23.1 10.8 6.9];
    Conc_2 = [0 3.63 4.54 6.36 5.45];

    % Pristine; 28 nm; AS- Initial 
    TSS_AS= [1711.0 443.0 16.7 82.7 297.7];
    TSS_AS_std = [57.2 77.3 6.1 71.5 102.4];
    Set_time_AS = [0 60 300 120 90];

    % Pristine; 28 nm; AL- Initial 
    TSS_AL= [113.0 85.7 72.0 70.7 92.0 59.7];
    TSS_AL_std = [12.5 2.5 5.6 1.2 2.8 0.6];
    TSS_AL_alum= 59.7;
    TSS_AL_alum_std = 0.6;
    Set_time_AL = [0 30 120 60 5 30];
    Set_time_AL_alum = 30;


    %{
    figure
    set(gcf,'Position',[184,402,427,303]) 

    er1 = errorbar(Conc_1,TSS_WW,TSS_WW_std,TSS_WW_std);
                        er1.Color = [0 0 0];                            
                        er1.LineStyle = 'none'; 
                        er1.Marker = 'o';
                        er1.MarkerSize = 5;
                        er1.MarkerEdgeColor= '#79254A';
                        er1.MarkerFaceColor= '#79254A';
                        er1.LineWidth = 2;   
    hold on
    rectangle('Position',[0 0 6 25], 'FaceColor',[0.7, 0.9, 0.9, 0.6],'EdgeColor',[0.7, 0.9, 0.9, 0.6],'LineWidth',0.01)
    uistack(er1, 'top');
    ylabel('TSS (mg/L)');
    xlabel('Alum concentration (mg Al/L)');
    ylim([0,60])
    xlim([0,6])
    box on
    set(gca,'FontSize',16,'LineWidth',1.5)
    text(4,50,'La Prairie municipal wastewater','HorizontalAlignment','center','FontSize',16,'Color','k')
    text(0.1*6,0.9*60,'a','HorizontalAlignment','center','FontSize',20,'Color','k','FontWeight', 'Bold')

    %}

    %{
    figure
    set(gcf,'Position',[184,402,427,303]) 

    er1 = errorbar(Conc_2,TSS_WW_RP,TSS_WW_RP_std,TSS_WW_RP_std);
                        er1.Color = [0 0 0];                            
                        er1.LineStyle = 'none'; 
                        er1.Marker = 'o';
                        er1.MarkerSize = 5;
                        er1.MarkerEdgeColor= '#79254A';
                        er1.MarkerFaceColor= '#79254A';
                        er1.LineWidth = 2;   
    hold on
    rectangle('Position',[0 0 8 25], 'FaceColor',[0.7, 0.9, 0.9, 0.6],'EdgeColor',[0.7, 0.9, 0.9, 0.6],'LineWidth',0.01)
    uistack(er1, 'top');
    ylabel('TSS (mg/L)');
    xlabel('Alum concentration (mg Al/L)');
    ylim([0,100])
    xlim([3,7])
    box on
    set(gca,'FontSize',16,'LineWidth',1.5)
    text(5,80,sprintf('Repentigny\nmunicipal wastewater'),'HorizontalAlignment','left','FontSize',16,'Color','k')
    text(0.1*4+3,0.9*100,'b','HorizontalAlignment','center','FontSize',20,'Color','k','FontWeight', 'Bold')

    %}

    %{
    figure
    set(gcf,'Position',[184,402,427,303]) 

    er2 = errorbar(Set_time_AS,TSS_AS,TSS_AS_std,TSS_AS_std);
                        er2.Color = [0 0 0];                            
                        er2.LineStyle = 'none'; 
                        er2.Marker = 'o';
                        er2.MarkerSize = 5;
                        er2.MarkerEdgeColor= '#79254A';
                        er2.MarkerFaceColor= '#79254A';
                        er2.LineWidth = 2;   
    hold on
    rectangle('Position',[0 0 350 25], 'FaceColor',[0.7, 0.9, 0.9, 0.6],'EdgeColor',[0.7, 0.9, 0.9, 0.6],'LineWidth',0.01)
    uistack(er2, 'top');

    ylabel('TSS (mg/L)');
    xlabel('Settling time (s)');
    ylim([0,600])
    xlim([50,350])
    xticks(50:50:350)
    box on
    set(gca,'FontSize',16,'LineWidth',1.5)
    text(220,500,sprintf('activated sludge\ntreated water'),'HorizontalAlignment','left','FontSize',16,'Color','k')
    text(0.1*300,0.9*600,'c','HorizontalAlignment','center','FontSize',20,'Color','k','FontWeight', 'Bold')
        
    %}

    %{
    figure
    set(gcf,'Position',[184,402,427,303]) 

    er2 = errorbar(Set_time_AL,TSS_AL,TSS_AL_std,TSS_AL_std);
                        er2.Color = [0 0 0];                            
                        er2.LineStyle = 'none'; 
                        er2.Marker = 'o';
                        er2.MarkerSize = 5;
                        er2.MarkerEdgeColor= '#79254A';
                        er2.MarkerFaceColor= '#79254A';
                        er2.LineWidth = 2;   
        hold on

        er2 = errorbar(Set_time_AL_alum,TSS_AL_alum,TSS_AL_alum_std,TSS_AL_alum_std);
                        er2.Color = '#7fb800';                            
                        er2.LineStyle = 'none'; 
                        er2.Marker = 'o';
                        er2.MarkerSize = 5;
                        er2.MarkerEdgeColor= '#7fb800';
                        er2.MarkerFaceColor= '#7fb800';
                        er2.LineWidth = 2;  

    ylabel('TSS (mg/L)');
    xlabel('Settling time (min)');
    ylim([0,130])
    xlim([-10,130])
    xticks(0:30:120)
    box on
    set(gca,'FontSize',16,'LineWidth',1.5)
    legend({'0 mg/L alum', '1.82 mg Al/L alum'},'Location', 'Northeast');
    legend boxoff
    text(0,20,sprintf('aerated lagoons \ntreated water'),'HorizontalAlignment','left','FontSize',16,'Color','k')
    text(0.9*140,0.1*130,'d','HorizontalAlignment','center','FontSize',20,'Color','k','FontWeight', 'Bold')
    
    
    %}    
 %}

% S6) Microfiber Size
%{
    file10= strcat('Processed Data/Microfiber_Size.csv');
    A = readtable(file10);
    A= A{:,:}*1E3;
    Color1 = [0, 0.5, 0];
    figure
        set(gcf,'Position',[212,302,980,405])
        subplot(1,2,1)
        [N1, e1]= histcounts(A);                
    
        Pl1= histogram(A,6);
        Pl1(1).FaceColor = Color1;
    
        hold on
        text(0.9*1500,0.9*30,'a','HorizontalAlignment','center','FontSize',20,'Color','k','FontWeight', 'Bold')
        hold off
        axis([0,1500,0,30])
        xticks(0:300:1500)
        xlabel('Length (\mum)');
        ylabel('Count');
        set(gca,'FontSize',16)
    
        subplot(1,2,2)
        dx=0.1;
    
        plot (7*ones(length(A),1),A,'x','Color',Color1,'MarkerFaceColor',Color1,'MarkerSize',15);
        hold on
        line([7-dx,7+dx],[mean(A),mean(A)],'Color',Color1,'LineWidth',2)
        line([7-dx,7+dx],[median(A),median(A)],'Color',Color1,'LineWidth',2,'LineStyle',':')
        text(6.7+0.9*(7.3-6.7),0.9*1500,'b','HorizontalAlignment','center','FontSize',20,'Color','k','FontWeight', 'Bold')
        hold off
        
        axis([6.7,7.3,0,1500])
        yticks(0:150:1500)
        set(gca,'xtick',[]);
        ylabel('Size (\mum)');
        xlabel('Polyester microfibers');
        xticklabels({''})
        set(gca,'FontSize',16)

%}
   
% S7) Microfiber + Microsphere linear relationship
 %{       
 Color1= '#a56879';
    Color2= '#a09c51';
    Color3 = '#5f5b7a';
    Color4 = '#2b9eb3';
    

    TSS_lim= 0.65;


    figure
    set(gcf,'Position',[184,402,427,303])
    scatter (Microfiber{:,end-1}*100, Microfiber{:,end}*100,100,'d','MarkerEdgeColor','k','MarkerFaceColor',Color1)
    hold on
    %scatter (Microplastic{:,end-1}*100, Microplastic{:,end}*100,100,'s','MarkerEdgeColor','k','MarkerFaceColor',Color2)
    %scatter (Microfragment{:,end-1}*100, Microfragment{:,end}*100,100,'^','MarkerEdgeColor','k','MarkerFaceColor',Color4)
        box on
        ax = gca;
        ax.XAxis.MinorTick = 'on';
        ax.XAxis.MinorTickValues = 10:10:90;
        ax.YAxis.MinorTick = 'on';
        ax.YAxis.MinorTickValues = 10:10:90;
        set(gca,'FontSize',18,'LineWidth',1.5)
        xlim([0,100])
        ylim([0,100])
        yticks(0:20:100)

    TSS= Microfiber{:,end-1}(Microfiber{:,end-1}<TSS_lim)*100;
    MF= Microfiber{:,end}(Microfiber{:,end-1}<TSS_lim)*100;
    scatter (TSS, MF,100,'d','MarkerEdgeColor','k','MarkerFaceColor','k')
        c1 = polyfit(TSS,MF,1);
        y_est1 = polyval(c1,0:5:TSS_lim*100);    
        R1=corrcoef(MF,TSS.*c1(1)+c1(2));
        R1=R1(2)^2;
        plot(0:5:TSS_lim*100,y_est1,'--','Color','k','LineWidth',2)
        text(50,70,strcat('y=',string(round(c1(1),2)),'x +',string(round(c1(2)/100,2))),'HorizontalAlignment','left','FontSize',14,'Color','k','FontWeight', 'Bold')
        text(50,60,strcat('R^{2}= ',string(round(R1,2))),'HorizontalAlignment','left','FontSize',14,'Color','k','FontWeight', 'Bold')


    text(10,10,'a','HorizontalAlignment','center','FontSize',20,'Color','k','FontWeight', 'Bold')
    hold off
    yticklabels({"",20,40,60,80,100})
    ylabel('Microfiber removal (%)','HorizontalAlignment','center','Color','k');
    xlabel('Total suspended solids removal (%)','HorizontalAlignment','center','Color','k')
    [~, objh] = legend({'microfiber','microfiber with TSS < 65%','linear fit',''},'Location', 'Southeast');
            %/ set font size as desired
            objhl = findobj(objh, 'type', 'patch'); %// objects of legend of type line
            set(objhl, 'Markersize', 10); %// set marker size as desired
        
    legend boxoff 

    % Microsphere
        figure
    set(gcf,'Position',[184,402,427,303])
    %scatter (Microfiber{:,end-1}*100, Microfiber{:,end}*100,100,'d','MarkerEdgeColor','k','MarkerFaceColor',Color1)
    scatter (Microplastic{:,end-1}*100, Microplastic{:,end}*100,100,'s','MarkerEdgeColor','k','MarkerFaceColor',Color2)
    hold on
    %scatter (Microfragment{:,end-1}*100, Microfragment{:,end}*100,100,'^','MarkerEdgeColor','k','MarkerFaceColor',Color4)
        box on
        ax = gca;
        ax.XAxis.MinorTick = 'on';
        ax.XAxis.MinorTickValues = 10:10:90;
        ax.YAxis.MinorTick = 'on';
        ax.YAxis.MinorTickValues = 10:10:90;
        set(gca,'FontSize',18,'LineWidth',1.5)
        xlim([0,100])
        ylim([0,100])
        yticks(0:20:100)

    TSS= Microplastic{:,end-1}(Microplastic{:,end-1}<TSS_lim)*100;
    MS= Microplastic{:,end}(Microplastic{:,end-1}<TSS_lim)*100;
    scatter (TSS, MS,100,'s','MarkerEdgeColor','k','MarkerFaceColor','k')
        c1 = polyfit(TSS,MS,1);
        y_est1 = polyval(c1,0:5:TSS_lim*100);    
        R1=corrcoef(MS,TSS.*c1(1)+c1(2));
        R1=R1(2)^2;
        plot(0:5:TSS_lim*100,y_est1,'--','Color','k','LineWidth',2)
        text(70,50,strcat('y=',string(round(c1(1),2)),'x +',string(round(c1(2)/100,2))),'HorizontalAlignment','left','FontSize',14,'Color','k','FontWeight', 'Bold')
        text(70,40,strcat('R^{2}= ',string(round(R1,2))),'HorizontalAlignment','left','FontSize',14,'Color','k','FontWeight', 'Bold')


    text(10,90,'b','HorizontalAlignment','center','FontSize',20,'Color','k','FontWeight', 'Bold')
    hold off
    yticklabels({"",20,40,60,80,100})
    ylabel('Microfiber removal (%)','HorizontalAlignment','center','Color','k');
    xlabel('Total suspended solids removal (%)','HorizontalAlignment','center','Color','k')
    [~, objh] = legend({'microsphere','microsphere with TSS < 65%','linear fit',''},'Location', 'Southeast');
            %/ set font size as desired
            objhl = findobj(objh, 'type', 'patch'); %// objects of legend of type line
            set(objhl, 'Markersize', 10); %// set marker size as desired
        
    legend boxoff 
 %}

% S8) HDPE fragments
    
%{
    file1= strcat('Processed Data/Microfragment_fiber_size.csv');
    fid1 = fopen(file1,'r');
    A = textscan(fid1, '%f', 'Delimiter',',');

    file2= strcat('Processed Data/Microfragment_irregular_size.csv');
    fid2 = fopen(file2,'r');
    B = textscan(fid2, '%f', 'Delimiter',',');

    figure
        set(gcf,'Position',[212,371,980,336])
        subplot(1,2,1)
        [N1, e1]= histcounts(A{1});                
        
        clr= [0.47,0.67,0.19];
        Pl1= histogram(A{1},10);
        Pl1(1).FaceColor = clr;
    
        hold on
        text(0.9*900,0.9*20,'c','HorizontalAlignment','center','FontSize',20,'Color','k','FontWeight', 'Bold')
        hold off
        axis([0,900,0,20])
        xticks(0:150:900)
        xlabel('Size (\mum)');
        ylabel('Count');
        set(gca,'FontSize',16)
    
        subplot(1,2,2)
        dx=0.1;
    
        plot (7*ones(length(A{1}),1),A{1},'x','Color',clr,'MarkerSize',15);
        hold on
        line([7-dx,7+dx],[mean(A{1}),mean(A{1})],'Color',clr,'LineWidth',2)
        line([7-dx,7+dx],[median(A{1}),median(A{1})],'Color',clr,'LineWidth',2,'LineStyle',':')
        text(6.7+0.9*(7.3-6.7),0.9*900,'d','HorizontalAlignment','center','FontSize',20,'Color','k','FontWeight', 'Bold')

        hold off
        
        axis([6.7,7.3,0,900])
        yticks(0:100:900)
        set(gca,'xtick',[]);
        ylabel('Length (\mum)');
        xlabel('HDPE fiber-shape fragments');
        xticklabels({''})
        set(gca,'FontSize',16)




        figure
        set(gcf,'Position',[212,371,980,336])
        subplot(1,2,1)
        [N1, e1]= histcounts(B{1});                
        
        clr= [0.77,0.02,0.02];
        Pl1= histogram(B{1},10);
        Pl1(1).FaceColor = clr;
    
        hold on
        text(0.9*200,0.9*15,'e','HorizontalAlignment','center','FontSize',20,'Color','k','FontWeight', 'Bold')
        hold off

        axis([0,200,0,15])
        xticks(0:40:200)
        yticks(0:2.5:15)
        xlabel('Size (\mum)');
        ylabel('Count');
        set(gca,'FontSize',16)
    
        subplot(1,2,2)
        dx=0.1;
    
        plot (7*ones(length(B{1}),1),B{1},'x','Color',clr,'MarkerSize',15);
        hold on
        line([7-dx,7+dx],[mean(B{1}),mean(B{1})],'Color',clr,'LineWidth',2)
        line([7-dx,7+dx],[median(B{1}),median(B{1})],'Color',clr,'LineWidth',2,'LineStyle',':')
        text(0.1*200,0.9*15,'a','HorizontalAlignment','center','FontSize',20,'Color','k','FontWeight', 'Bold')
        text(6.7+0.9*(7.3-6.7),0.9*200,'f','HorizontalAlignment','center','FontSize',20,'Color','k','FontWeight', 'Bold')

        hold off
        
        axis([6.7,7.3,0,200])
        yticks(0:40:200)
        set(gca,'xtick',[]);
        ylabel('Effective length (\mum)');
        xlabel('HDPE irregular-shaped fragments');
        xticklabels({''})
        set(gca,'FontSize',16)

%}

% S9) S10) Calibration Curves- NP vs Intensity
%{

    Color1 = [0, 0.5, 0];
    
    % Pristine; 28 nm; SWW- SiO2
    NP_P_Cal_1 = [0	0.1	0.2	0.25	0.4	0.5	1	1.25 2; 5760	7210	8860	9380	11600	12700	20600	25100 43300];
    NP_P_Cal_2 = [0	0.1	0.2	0.25	0.4	0.5	1	1.25	2; 4599.333333	6623.333333	8153	9298.666667	11043.33333	14605	23219	30038.66667	47248.66667];
    NP_P_Cal_3 = [2	1.25	1	0.5	0.4	0.25	0.2	0.1	0; 37246.25	27274.08333	18697.83333	12636	9200.857143	7920.416667	7186.416667	6062.25	4378.083333];
    
    % Aged; ; 28 nm; SWW- SiO2
    NP_A_Cal_1 = [1.76	1.1	0.88	0.44	0.352	0.22	0.176	0.088;34911.77778	25905.11111	20895.66667	14312.88889	10256.22222	8900.111111	7879.666667	6322.444444];
    NP_A_Cal_2 = [1.76	1.1	0.88	0.44	0.352	0.22	0.176	0.088;34738.66667	25933.77778	20170	13182.66667	10686.11111	8659	7831.666667	6464.333333];
    NP_A_Cal_3 = [1.76	1.1	0.88	0.44	0.352	0.22	0.176	0.088;32589	25133.66667	19991.22222	12886.66667	9831.888889	8875.222222	7905.888889	6239];
    NP_A_Cal_4 = [1.76	1.1	0.88	0.44	0.352	0.22	0.176	0.088;34887.66667	23401.44444	20788	13378.66667	11281.77778	8752.444444	7710.666667	6191];
    NP_A_Cal_5 = [1.32	1.1	0.66	0.88	0.55	0.44	0.22	0.176	0.11	0.088	0.044	0;26044.88889	22145.77778	15207	16778.33333	12751.66667	10771.88889	7876.888889	6265.222222	5829	5502.111111	4959.222222	4858.555556];
    NP_A_Cal_6 = [1.76	1.1	0.88	0.44	0.352	0.22	0.176	0.088	0; 27599.44444	23579.88889	19105.66667	11401.77778	9312.666667	8351.666667	7678.666667	6649	4617.944444];
    NP_A_Cal_7 = [1.76	1.1	0.88	0.44	0.352	0.22	0.176	0.088	0; 30997.66667	22543.66667	18533	11803.44444	9220	8052.444444	7322.111111	6019.444444	4622.722222];

    % Aged; 50 nm; SWW- SiO2; COOH
    NP_50_COOH_Cal_1= [1.492537313	1.25	1	0.5	0.4	0.25	0.2	0; 30883.25	23316.58333	18912.33333	10175.08333	7666.916667	4435.25	3733.166667	31.91666667];
    NP_50_COOH_Cal_2= [1.492537313	1.25	1	0.5	0.4	0.25	0.2	0; 33500	26300	19500	10500	8100	4660	4000	70.6];
    NP_50_COOH_Cal_3= [1.492537313	1.25	1	0.5	0.4	0.25	0.2	0; 30654.41667	26513.75	20058.41667	10934.5	7147.75	4637.416667	4274.75	45.33333333];

    % Aged; 50 nm; SWW- SiO2; COOH
    NP_50_COOH_Cal_pt1_1= [0.2	0.125	0.1	0.05	0.04	0.025	0.02	0.01	0; 22791.57143	15123.58333	11720.16667	6489.166667	4287.666667	3205.75	2540.916667	1518	198.3333333];
    
    % Aged; 220 nm; SWW- SiO2; COOH
    NP_220_COOH_Cal_1= [8	7.142857143	6.25	5	4	2	1	0; 46213.16667	40248.08333	36396.66667	29733.16667	24314.83333	12049.08333	6682.416667	767.6666667];
    NP_220_COOH_Cal_2= [8	7.142857143	6.25	5	4	2	1	0; 41251.08333	37147.91667	32505.58333	27490.83333	21912.5	10626.33333	6937.166667	406];
    NP_220_COOH_Cal_3= [8	7.142857143	6.25	5	4	2	1	0; 42458.08333	39480.25	33195.58333	28708.33333	23577.33333	11463.16667	6214.083333	513.8333333];
    
    % Aged; 50 nm; SWW- SiO2; non-functionalized
    NP_50_NF_Cal_1= [2	1.492537313	1.25	1	0.5	0.4	0.25	0.2 0; 32466.375	27846.91667	23773.08333	19618.5	14169.33333	11933.5	9448.5	9586.083333	8010.083333];
    NP_50_NF_Cal_2= [2	1.492537313	1.25	1	0.5	0.4	0.25	0.2 0; 30721.75	25718.58333	22477.83333	18167.41667	12998	11275	8890.833333	9268	7168];

    % Aged; 28 nm; SWW- Kaolonite; COOH
    NP_P_Cal_Kao = [2	1.25	1	0.5	0.4	0.25	0.2	0.1 0; 44485.75	30314.33333	27029.11111	15012.16667	13047.5	9413.083333	8354.166667	6839	4670.166667];

    % Pristine; 250 nm; SWW- Silica; non-functionalized 
    NP_PVC_Cal = [2	1.25	1	0.5	0.4	0.25	0.2	0.1 0; 39233.5	25770.08333	19076.08333	11074.41667	8731.75	5995.25	5016.583333	3413	1459.083333];

    % Pristine; 28 nm; WW- Initial 
    NP_P_28_WW_LP_Initial = [2	1.25	1	0.5	0.4	0.25	0.2	0.1; 32665.16667	25835	21756.5	17413.16667	15023.58333	14020.75	14552.41667	13001.33333];
    NP_P_28_WW_LP_Final = [2	1.25	1	0.5	0.4	0.25	0.2	0.1	0; 34140.83333	26385.5	21981.91667	16026.75	14263.5	12637.91667	11843.83333	11084.58333	9350.333333];
    NP_P_28_WW_LP={NP_P_28_WW_LP_Initial;NP_P_28_WW_LP_Final};

    % Pristine; PVC 250 nm; WW- Initial 
    NP_PVC_250_WW_RP_Initial = [1.25	1	0.5	0.4	0.25	0.2	0.1	0; 37759.75	30752.75	18654.08333	16128	12371.08333	10965.08333	8995.416667	6132.833333];
    NP_PVC_250_WW_RP_Final = [1.25	1	0.5	0.4	0.25	0.2	0.1	0; 46707.88889	38299.66667	22399.66667	19819.66667	15007.33333	12709	10268.75	7082.416667];
    NP_PVC_250_WW_RP={NP_PVC_250_WW_RP_Initial;NP_PVC_250_WW_RP_Final};

    % Pristine; 28 nm; AS- Final 
    NP_P_28_AS_Final= [2	1.25	1	0.5	0.4	0.25	0.2	0.1; 48300	38500	31600	25000	21300	19400	18800	18200];

    % Pristine; PVC 250 nm; AL- Final 
    NP_PVC_250_AL_Initial = [2	1.25	1	0.5	0.4	0.25	0.2	0.1 0; 42804.83333	28443.83333	23108.91667	14569.75	12813.33333	9708	8630.416667	7322.416667	5160.666667];
    NP_PVC_250_AL_Final = [2	1.25	1	0.5	0.4	0.25	0.2	0.1	0; 38584.75	26632.5	21916.58333	13434.75	11928.25	9514.916667	8542.75	7256.25	5380.5];
    NP_PVC_250_AL={NP_PVC_250_AL_Initial;NP_PVC_250_AL_Final};


    NP_Cal_Master = {NP_P_Cal_1,NP_A_Cal_1,NP_50_COOH_Cal_1,NP_50_COOH_Cal_pt1_1,NP_220_COOH_Cal_1,NP_50_NF_Cal_1,NP_P_Cal_Kao,NP_PVC_Cal,NP_P_28_WW_LP,NP_PVC_250_WW_RP,NP_P_28_AS_Final,NP_PVC_250_AL};
    legend_Cal = {'28 nm (PS-COOH; pristine; silica)';'28 nm (PS-COOH; aged; silica)'; '50 nm (PS-COOH; aged; silica)';'50 nm (PS-COOH; pristine; silica)';'220 nm (PS-COOH; aged; silica)';'50 nm (PS-none; aged; silica)';'28 nm (PS-COOH; pristine; silica/kaolinite)';
        '250 nm (PVC-none; pristine; silica)';'WWTP1 municipal\nwastewater influent\n28 nm (PS-COOH)';'WWTP2 municipal wastewater influent\n250 nm (PVC-nonfunctionalized)';'activated sludge\n28 nm (PS-COOH)';'aerated lagoons\n250 nm (PVC-nonfunctionalized)'};
    label= {'a','b','c','d','e','f','g','h','a','b','c','d'};

    for i= 1:1:length(NP_Cal_Master)
    NP_Cal = NP_Cal_Master{i}; 
    
    clear size
    if size(NP_Cal,2)>2
        j_end=1;
        Int= NP_Cal(2,:);
        Conc= NP_Cal(1,:);
        c1 = polyfit(Int,Conc,1);
        y_est1 = polyval(c1,0:100:max(Int));    
        R1=corrcoef(Int,Conc);
        R1=R1(2)^2;

    figure
    set(gcf,'Position',[184,402,427,303]) 
    scatter (Int, Conc,75,'MarkerEdgeColor','#79254A','MarkerFaceColor','#79254A')
    hold on
    plot(0:100:max(Int),y_est1,'--','Color','#79254A','LineWidth',2)
    
    else
        j_end=2;
        Int_1= NP_Cal{1}(2,:);
        Conc_1= NP_Cal{1}(1,:);
        c1 = polyfit(Int_1,Conc_1,1);
        y_est1 = polyval(c1,0:100:max(Int_1));    
        R1=corrcoef(Int_1,Conc_1);
        R1=R1(2)^2;

        Int_2= NP_Cal{2}(2,:);
        Conc_2= NP_Cal{2}(1,:);
        c1 = polyfit(Int_2,Conc_2,1);
        y_est2 = polyval(c1,0:100:max(Int_2));    
        R2=corrcoef(Int_2,Conc_2);
        R2=R2(2)^2;

    figure
    set(gcf,'Position',[184,402,427,303]) 
    scatter (Int_1, Conc_1,75,'MarkerEdgeColor','#79254A','MarkerFaceColor','#79254A')
    hold on
    scatter (Int_2, Conc_2,75,'MarkerEdgeColor','#7fb800','MarkerFaceColor','#7fb800')
    plot(0:100:max(Int_1),y_est1,'--','Color','#79254A','LineWidth',2)
    plot(0:100:max(Int_2),y_est2,'--','Color','#7fb800','LineWidth',2)
    end



    ylimit={[0,2.5];[0,2];[0,2];[0,0.25];[0,10];[0,2.5];[0,2.5];[0,2.5];[0,2.5];[0,2];[0,2.5];[0,2.5]};
    xlimit= {[0,50000];[0,40000];[0,40000];[0,25000];[0,50000];[0,50000];[0,50000];[0,40000];[0,50000];[0,50000];[0,50000];[0,50000]};
    ylim(ylimit{i})
    xlim(xlimit{i})
    
    for j=1:j_end
        ColorText='#79254A';
        if j == 2; R1=R2;legend({'initial','treated water'},'Location', 'best');legend boxoff;ColorText='#7fb800'; end
        if R1>0.99
            text(0.05*max(xlimit{i}),0.5*max(ylimit{i}),'R^{2}> 0.99','HorizontalAlignment','left','FontSize',14,'Color',ColorText,'FontWeight', 'Bold')
        else
            text(0.05*max(xlimit{i}),0.5*max(ylimit{i}),strcat('R^{2}= ',string(round(R1,2))),'HorizontalAlignment','left','FontSize',14,'Color','#79254A','FontWeight', 'Bold')
        end

    end

    hold off

    ylabel({'Concentration (ppm)'});
    xlabel('Intensity (a.u.)');

    box on
    set(gca,'FontSize',16,'LineWidth',1.5)
    text(0.05*max(xlimit{i}),0.9*max(ylimit{i}),sprintf(string(legend_Cal(i))),'HorizontalAlignment','left','FontSize',14,'Color','k')
    text(0.9*max(xlimit{i}),0.1*max(ylimit{i}),label(i),'HorizontalAlignment','center','FontSize',20,'Color','k','FontWeight', 'Bold')

    end
        
 %}


% S11) Calibration Curves- TSS vs Turbidity

%{

    Color1 = [0, 0.5, 0];
    
    % Pristine; 28 nm; SWW- SiO2
    TSS_Turb_SWW = [53.2 40.2 28.2 13.7 4.3;58.3 42.0 28.8 16.2 5.7];
    TSS_Turb_SWW_std = [4.0	0.2	0.8	1.2	0.6; 1.2 0.2 1.2 0.5 0.1];

    % Pristine; 28 nm; WW LP- Initial 
    TSS_Turb_WW_LP = [280.7 21.0 26.3 40.3 49.7; 104.3 4.9 5.9 9.5 15.5];
    TSS_Turb_WW_LP_std = [12.9 1.0 2.5 4.7 5.9;2.0 0.7 0.8 2.2 1.4];

    % Pristine; 250 nm; WW RP- Initial 
    TSS_Turb_WW_RP = [156.7 83.0 43.0 67.0 49.0 28.0; 67.4 38.6 15.9 33.5 19.3 12.3];
    TSS_Turb_WW_RP_std = [11.0 6.1 5.3 23.1 10.8 6.9;1.4 0.8 2.1 11.0 4.5 0.6];

    % Pristine; 28 nm; AS- Initial 
    TSS_Turb_AS= [1711.0 443.0 16.7 82.7 297.7; 543.8 139.2 4.2 24.6 91.9];
    TSS_Turb_AS_std = [57.2 77.3 6.1 71.5 102.4; 49.8 21.8 0.6 21.2 31.7];

     % Pristine; 350 nm; AL- Initial 
    TSS_Turb_AL= [113.0 85.7 72.0 70.7 92.0 59.7; 104.7 63.2 53.3 59.1 76.6 33.7];
    TSS_Turb_AL_std = [12.5 2.5 5.6 1.2 2.8 0.6; 3.7 1.1 1.7 1.0 0.8 1.4];

    
    TSS_Turb_Master = {TSS_Turb_SWW,TSS_Turb_WW_LP,TSS_Turb_WW_RP,TSS_Turb_AS,TSS_Turb_AL};
    TSS_Turb_std = {TSS_Turb_SWW_std,TSS_Turb_WW_LP_std,TSS_Turb_WW_RP_std,TSS_Turb_AS_std,TSS_Turb_AL_std};
    legend_Cal = {'synthetic wastewater';'WWTP1 municipal\nwastewater influent';'WWTP2 municipal\nwastewater influent';'activated sludge';'aerated lagoons'};
    label= {'a','b','c','d','e'};

    for i= 1:1:length(TSS_Turb_Master)
    TSS_Turb = TSS_Turb_Master{i}; 
    TSS_std = TSS_Turb_std{i}; 

    
    Turb= TSS_Turb(2,:);
    TSS= TSS_Turb(1,:);
    c1 = polyfit(Turb,TSS,1);
    y_est1 = polyval(c1,0:1:max(Turb));    
    R1=corrcoef(Turb,TSS);
    R1=R1(2)^2;
    
   
    figure
    set(gcf,'Position',[184,402,427,303]) 

    er1 = errorbar(Turb,TSS,TSS_std(1,:),TSS_std(1,:));
                        er1.Color = '#79254A';                            
                        er1.LineStyle = 'none'; 
                        er1.Marker = 'o';
                        er1.MarkerSize = 5;
                        er1.MarkerEdgeColor= '#79254A';
                        er1.MarkerFaceColor= '#79254A';
                        er1.LineWidth = 2;   
    hold on

    ylimit={[0,60];[0,300];[0,180];[0,2000];[0,140]};
    xlimit= {[0,60];[0,120];[0,80];[0,600];[0,120]};
    ylim(ylimit{i})
    xlim(xlimit{i})

    plot(0:1:max(Turb),y_est1,'--','Color','#79254A','LineWidth',2)
    if R1>0.99
            text(0.05*max(xlimit{i}),0.5*max(ylimit{i}),'R^{2}> 0.99','HorizontalAlignment','left','FontSize',14,'Color','k','FontWeight', 'Bold')
    else
        text(0.05*max(xlimit{i}),0.5*max(ylimit{i}),strcat('R^{2}= ',string(round(R1,2))),'HorizontalAlignment','left','FontSize',14,'Color','k','FontWeight', 'Bold')
    end
        hold off
     if c1(2)>0
     text(0.05*max(xlimit{i}),0.6*max(ylimit{i}),strcat('y=',string(round(c1(1),2)),'x+',string(round(c1(2),2))),'HorizontalAlignment','left','FontSize',14,'Color','k','FontWeight', 'Bold')
     else
     text(0.05*max(xlimit{i}),0.6*max(ylimit{i}),strcat('y=',string(round(c1(1),2)),'x',string(round(c1(2),2))),'HorizontalAlignment','left','FontSize',14,'Color','k','FontWeight', 'Bold')
     end
    ylabel({'TSS (mg/L)'});
    xlabel('Turbidity (NTU)');

    box on
    set(gca,'FontSize',16,'LineWidth',1.5)
    text(0.05*max(xlimit{i}),0.9*max(ylimit{i}),sprintf(string(legend_Cal(i))),'HorizontalAlignment','left','FontSize',16,'Color','k')
    text(0.9*max(xlimit{i}),0.1*max(ylimit{i}),label(i),'HorizontalAlignment','center','FontSize',20,'Color','k','FontWeight', 'Bold')


    end
        
 %}


% S12) Calibration Curve for 220 nm NPs

%{
    Color1 = [0, 0.5, 0];
    
    % Pristine; 28 nm; SWW- SiO2
    TSS_Turb_DI = [60.033	51.567	43.300	35.033	29.733	21.533	14.300	7.197	0.063;8	7	6	5	4	3	2	1	0];
    
    % Pristine; 28 nm; WW- Initial 
    TSS_Turb_SWW = [83.23333333	110.3333333	97.16666667	64.73333333	54.23333333; 4	7.843137255	6.274509804	1.568627451	0];


    
    NP_Cal_Master = {TSS_Turb_DI,TSS_Turb_SWW};
    legend_Cal = {'distilled water','','synthetic wastewater',''};
    Color= {'#79254A',[0.50,0.41,0.56]};

    for i= 1:1:length(NP_Cal_Master)
    NP_Cal = NP_Cal_Master{i}; 

        Int= NP_Cal(2,:);
        Conc= NP_Cal(1,:);

    if i == 1
        slope=Int(:)\Conc(:)
        y_est1 = polyval([slope,0],0:1:1.3*max(Int));    
        R1=corrcoef(Int,Conc.*slope);
        R1=R1(2)^2;
        hold on
        text(7.5,35,strcat('y=',string(round(slope,2)),'x'),'HorizontalAlignment','left','FontSize',14,'Color',Color{i},'FontWeight', 'Bold')
        text(7.5,20,'R^{2}> 0.99 ','HorizontalAlignment','left','FontSize',14,'Color',Color{i},'FontWeight', 'Bold')
    end

    if i ==2
            c1 = polyfit(Int,Conc,1);
        y_est1 = polyval(c1,0:1:1.3*max(Int));    
        R1=corrcoef(Int,Conc);
        R1=R1(2)^2;
        text(3,55,'R^{2}> 0.99 ','HorizontalAlignment','center','FontSize',14,'Color',Color{i},'FontWeight', 'Bold')
    end


    set(gcf,'Position',[184,402,427,303]) 
    scatter (Int, Conc,75,'MarkerEdgeColor',Color{i},'MarkerFaceColor',Color{i})
    plot(0:1:1.3*max(Int),y_est1,'--','Color',Color{i},'LineWidth',2)
    R1=0.99;

    ylabel({'Turbidity (NTU)'});
    xlabel('220 nm Nanoplastic concentration (ppm)');
    ylim([0,120])
    xlim([0,1.2*max(Int)])
    box on
    set(gca,'FontSize',16,'LineWidth',1.5)

    legend boxoff
     

    end
    legend(legend_Cal, 'location', 'northwest','FontSize',14);
%}



% {
    function [param,R2,RMSE,p] = find_param(TSS,NP)
    fun = @(param)(((1/length(NP))*sum((NP-(1-(1-TSS).^param)).^2)).^0.5);
    param = fminbnd(fun,0,10);
    
    NP_pred = (1-(1-TSS).^param);
    [R2,p]=corrcoef(NP,NP_pred);
    R2=R2(2)^2;
    RMSE= ((1/length(NP))*sum((NP-(1-(1-TSS).^param)).^2)).^0.5;
    end
    %}