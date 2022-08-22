#define MyAppName "Instalalar Impressora Térmica Não Fiscal"
#define MyAppVersion "0.9.1"
#define MyAppPublisher "Delutto"
#define MyAppURL "https://github.com/Delutto/thermal_printers"
#define MyAppExeName "MyProg.exe"
#define MyAppID "{CAEE27B6-4093-4999-BAC5-5175399A31F0}"

[Setup]
AppId={{#MyAppID}
AppName={#MyAppName}
AppVersion={#MyAppVersion}
;AppVerName={#MyAppName} {#MyAppVersion}
AppPublisher={#MyAppPublisher}
AppPublisherURL={#MyAppURL}
AppSupportURL={#MyAppURL}
AppUpdatesURL={#MyAppURL}
CreateAppDir=no
OutputBaseFilename=Instalar_Impressora_0.9.1
Compression=lzma2/ultra64
SolidCompression=yes
PrivilegesRequired=none
UsePreviousGroup=False
Uninstallable=no
InternalCompressLevel=ultra64
DisableStartupPrompt=True
DisableReadyPage=True
DisableReadyMemo=True
DisableFinishedPage=True

[Languages]
Name: "brazilianportuguese"; MessagesFile: "compiler:Languages\BrazilianPortuguese.isl"

[CustomMessages]
CustomForm_Caption=Seleção da Impressora
CustomForm_Description=Selecione a Marca e o Modelo da impressora que deseja instalar os drivers.
CustomForm_Label1_Caption0=Marca
CustomForm_Label2_Caption0=Modelo
CustomForm_ComboBoxModelo_Text0=Selecione o Modelo...
CustomForm_ComboBoxMarca_Text0=Selecione a Marca...
CustomForm_ComboBoxMarca_Strings=Bematech%nDaruma%nDiebold%nElgin%nEpson%nJetway%nPerto%nPOS%nPrintID%nSweda%nTanca
BematechList=MP-2500 TH%nMP-2800 TH%nMP-4000 TH%nMP-4200 TH%nMP-4200 TH ADV%nMP-100S TH%nMP-5100 TH%nPP-10
DarumaList=DR700%nDR800%nFS700%nFS800
DieboldList=TSP143MU%nMecaf Perfecta%nIM903TT%nIM693H-002%nIM453HU%nIM433TD%nIM113ID%nIM402TD
ElginList=i7%ni8%ni9%nVOX%nVOX+%nNIX%nProlific 2303%nProlific 23XX
EpsonList=TM-T20%nTM-T20X%nTM-T81%nTM-T88 IV%nTM-T88 V%nTM-T88 VI
JetwayList=JP-100%nJP-500%nJP-800
PertoList=PertoPrinter
POSList=POS 58%nPOS 80
PrintIDList=Print ID%nPrint ID Touch
SwedaList=SI-300%nSI-300E%nSI300W
TancaList=TMP-500%nTP-509%nTP-550%nTP-650

Download_Form_Caption=Baixando drivers
Download_Form_Description=Aguarde os drivers necessários serem baixados.
Download_Form_LabelDownloading_Caption0=Baixando...



[Code]
var
   Label1: TLabel;
   Label2: TLabel;
   ComboBoxModelo: TComboBox;
   ComboBoxMarca: TComboBox;
   URL: String;

   LabelDownloading: TLabel;
   ProgressBarDownload: TNewProgressBar;


procedure CustomForm_Activate(Page: TWizardPage);
begin
   WizardForm.ActiveControl := ComboBoxMarca;
   WizardForm.NextButton.Enabled := False;
end;

function CustomForm_ShouldSkipPage(Page: TWizardPage): Boolean;
begin
   Result := False;
end;

function CustomForm_BackButtonClick(Page: TWizardPage): Boolean;
begin
   Result := True;
end;

function CustomForm_NextButtonClick(Page: TWizardPage): Boolean;
begin
   Result := True;
   case ComboBoxMarca.ItemIndex of
      0: // Bematech
      begin
         case ComboBoxModelo.ItemIndex of
            0: // MP-2500 TH
            begin
               if IsWin64 then
                  URL := 'https://raw.githubusercontent.com/Delutto/thermal_printers/main/Bematech/BematechSpoolerDrivers_x64_v4.4.0.3.exe'
               else
                  URL := 'https://raw.githubusercontent.com/Delutto/thermal_printers/main/Bematech/BematechSpoolerDrivers_x86_v4.4.0.3.exe';   
            end;
            1: // MP-2800 TH
               URL := 'https://raw.githubusercontent.com/Delutto/thermal_printers/main/Bematech/Bematech_MP_2800_SpoolerDrivers_v1.3.exe';
            else // Outras...
            begin
               if IsWin64 then
                  URL := 'https://raw.githubusercontent.com/Delutto/thermal_printers/main/Bematech/BematechSpoolerDrivers_x64_v6.0.1.0.exe'
               else
                  URL := 'https://raw.githubusercontent.com/Delutto/thermal_printers/main/Bematech/BematechSpoolerDrivers_x86_v6.0.1.0.exe';
            end;
         end;
      end;
      1: // Daruma
      begin
         case ComboBoxModelo.ItemIndex of
            0: // DR700
               URL := 'https://raw.githubusercontent.com/Delutto/thermal_printers/main/Daruma/Daruma_DR700_Spooler_Driver_v4.0.0.8.exe';
            1: // DR800
               URL := 'https://raw.githubusercontent.com/Delutto/thermal_printers/main/Daruma/Daruma_DR800_Spooler_Driver_v2.0.1.7.exe';
            2: // FS700
               URL := 'https://raw.githubusercontent.com/Delutto/thermal_printers/main/Daruma/Daruma_FS700_v0.3.7.0.exe';
            3: // FS700
               URL := 'https://raw.githubusercontent.com/Delutto/thermal_printers/main/Daruma/Daruma_FS800_v1.0.0.0.exe';
         end; 
      end;
      2: // Diebold
      begin
         case ComboBoxModelo.ItemIndex of
            2: // IM903TT
               URL := 'https://raw.githubusercontent.com/Delutto/thermal_printers/main/Diebold/Diebold_IM903TT_1.0.1.exe';
            6: // IM113ID
            begin
               if IsWin64 then
                  URL := 'https://raw.githubusercontent.com/Delutto/thermal_printers/main/Diebold/Diebold_IM113ID_v1.2.0.10_x64.exe'
               else
                  URL := 'https://raw.githubusercontent.com/Delutto/thermal_printers/main/Diebold/Diebold_Printers_v1.34_drv_1.9.exe';
            end;
            else
               URL := 'https://raw.githubusercontent.com/Delutto/thermal_printers/main/Diebold/Diebold_Printers_v1.34_drv_1.9.exe';
         end;
      end;
      3: // Elgin
      begin
         case ComboBoxModelo.ItemIndex of
            0: // i7
               URL := 'https://raw.githubusercontent.com/Delutto/thermal_printers/main/Elgin/Elgin_i7_i9_v1.7.3.exe';
            1: // i8
               URL := 'https://raw.githubusercontent.com/Delutto/thermal_printers/main/Elgin/Elgin_i8_v7.1.7.exe';
            2: // i9
               URL := 'https://raw.githubusercontent.com/Delutto/thermal_printers/main/Elgin/Elgin_i7_i9_v1.7.3.exe';
            5: // Prolific 2303
               URL := 'https://raw.githubusercontent.com/Delutto/thermal_printers/main/Elgin/PL2303_Driver_v1.12.0.exe';
            6: // Prolific 23XX
               URL := 'https://raw.githubusercontent.com/Delutto/thermal_printers/main/Elgin/PL23XX_Driver_v4.0.2.exe';
            else // VOX e VOX+
               URL := 'https://raw.githubusercontent.com/Delutto/thermal_printers/main/Elgin/Elgin_VOX_V1.25.exe';
         end;
      end;
      4: // Epson
      begin
         case ComboBoxModelo.ItemIndex of
            0: // TM-T20
               URL := 'https://raw.githubusercontent.com/Delutto/thermal_printers/main/Epson/Epson_TM-T20_v5.6.0.0.exe';
            1: // TM-T20X
               URL := 'https://raw.githubusercontent.com/Delutto/thermal_printers/main/Epson/Epson_TM-T20X_v6.1.0.0.exe';
            2: // TM-T81
               URL := 'https://raw.githubusercontent.com/Delutto/thermal_printers/main/Epson/Epson_TM-T81_v15.0.0.498.exe';
            3: // TM-T88 IV
               URL := 'https://raw.githubusercontent.com/Delutto/thermal_printers/main/Epson/Epson_TM-T88_IV_4.0.0.0.exe';
            4: // TM-T88 V
               URL := 'https://raw.githubusercontent.com/Delutto/thermal_printers/main/Epson/Epson_TM-T88_V_v5.6.0.0.exe';
            5: // TM-T88 VI
               URL := 'https://raw.githubusercontent.com/Delutto/thermal_printers/main/Epson/Epson_TM-T88_VI_v5.11.0.0.exe';            
         end;
      end;
      5: // Jetway
      begin
         case ComboBoxModelo.ItemIndex of
            0: //JP-100
               URL := 'https://raw.githubusercontent.com/Delutto/thermal_printers/main/Jetway/Jetway_JMP-100_Driver_v2.61J.exe';
            1: //JP-500
               URL := 'https://raw.githubusercontent.com/Delutto/thermal_printers/main/Jetway/Jetway_JP-500_Printer_Driver_v7.17.exe';
            2: //JP-800
               URL := 'https://raw.githubusercontent.com/Delutto/thermal_printers/main/Jetway/Jetway_JP-800_PrinterDriver_v2.38E.exe';
         end;
      end;
      6: // Perto
         URL := 'https://raw.githubusercontent.com/Delutto/thermal_printers/main/PertoPrinter/PertoPrinter_Driver_2.5.exe';
      7: // POS
         URL := 'https://raw.githubusercontent.com/Delutto/thermal_printers/main/POS/POS_Printer_Driver_Setup_v11.3.0.0.exe';
      8: // Print ID
         URL := 'https://raw.githubusercontent.com/Delutto/thermal_printers/main/PrintID/Print_iD_&_Print_iD_Touch_v1.1.10.2.exe';
      9: // Sweda
         URL := 'https://raw.githubusercontent.com/Delutto/thermal_printers/main/Sweda/Sweda_SI-300_SI-300E_SI-300W_v1.2.0.exe';
      10: // Tanca
      begin
         case ComboBoxModelo.ItemIndex of
            0: // TMP-500
               URL := 'https://raw.githubusercontent.com/Delutto/thermal_printers/main/Tanca/Tanca_TMP-500_v2.61T.exe';
            1: // TP-509
               URL := 'https://raw.githubusercontent.com/Delutto/thermal_printers/main/Tanca/Tanca_TP-509_DriverInstall_v2.62.exe';
            3: // TP-550
               URL := 'https://raw.githubusercontent.com/Delutto/thermal_printers/main/Tanca/Tanca_TP-550_Printer_Driver_v8.1.1.2.exe';
            4: // TP-650
               URL := 'https://raw.githubusercontent.com/Delutto/thermal_printers/main/Tanca/Tanca_TP-650_DriverInstall_v2.11.exe';
         end;
      end;
   end;
end;

procedure CustomForm_CancelButtonClick(Page: TWizardPage; var Cancel, Confirm: Boolean);
begin
   // enter code here...
end;

procedure CustomForm_ComboBoxMarcaChange(Sender: TObject);
begin
   case ComboBoxMarca.ItemIndex of
      0: ComboBoxModelo.Items.Text := ExpandConstant('{cm:BematechList}'); 
      1: ComboBoxModelo.Items.Text := ExpandConstant('{cm:DarumaList}');
      2: ComboBoxModelo.Items.Text := ExpandConstant('{cm:DieboldList}');
      3: ComboBoxModelo.Items.Text := ExpandConstant('{cm:ElginList}');
      4: ComboBoxModelo.Items.Text := ExpandConstant('{cm:EpsonList}');
      5: ComboBoxModelo.Items.Text := ExpandConstant('{cm:JetwayList}');
      6: ComboBoxModelo.Items.Text := ExpandConstant('{cm:PertoList}');
      7: ComboBoxModelo.Items.Text := ExpandConstant('{cm:POSList}');
      8: ComboBoxModelo.Items.Text := ExpandConstant('{cm:PrintIDList}');
      9: ComboBoxModelo.Items.Text := ExpandConstant('{cm:SwedaList}');
      10: ComboBoxModelo.Items.Text := ExpandConstant('{cm:TancaList}');
   end;
   ComboBoxModelo.ItemIndex := 0;
   WizardForm.NextButton.Enabled := True;
end;

function CustomForm_CreatePage(PreviousPageId: Integer): Integer;
var
   Page: TWizardPage;
begin
   Page := CreateCustomPage(PreviousPageId,  ExpandConstant('{cm:CustomForm_Caption}'), ExpandConstant('{cm:CustomForm_Description}'));

   { Label1 }
   Label1 := TLabel.Create(Page);
   with Label1 do
   begin
      Parent := Page.Surface;
      Caption := ExpandConstant('{cm:CustomForm_Label1_Caption0}');
      Left := ScaleX(136);
      Top := ScaleY(56);
      Width := ScaleX(29);
      Height := ScaleY(13);
   end;
  
   { Label2 }
   Label2 := TLabel.Create(Page);
   with Label2 do
   begin
      Parent := Page.Surface;
      Caption := ExpandConstant('{cm:CustomForm_Label2_Caption0}');
      Left := ScaleX(136);
      Top := ScaleY(104);
      Width := ScaleX(34);
      Height := ScaleY(13);
   end;

   { ComboBoxModelo }
   ComboBoxModelo := TComboBox.Create(Page);
   with ComboBoxModelo do
   begin
      Parent := Page.Surface;
      Left := ScaleX(136);
      Top := ScaleY(120);
      Width := ScaleX(145);
      Height := ScaleY(21);
      TabOrder := 1;
      Style := csDropDownList;
      Text := ExpandConstant('{cm:CustomForm_ComboBoxModelo_Text0}');
   end;

   { ComboBoxMarca }
   ComboBoxMarca := TComboBox.Create(Page);
   with ComboBoxMarca do
   begin
      Parent := Page.Surface;
      Left := ScaleX(136);
      Top := ScaleY(72);
      Width := ScaleX(145);
      Height := ScaleY(21);
      TabOrder := 0;
      Style := csDropDownList;
      Text := ExpandConstant('{cm:CustomForm_ComboBoxMarca_Text0}');
      Items.Text := ExpandConstant('{cm:CustomForm_ComboBoxMarca_Strings}');
      OnChange := @CustomForm_ComboBoxMarcaChange;
   end;

   with Page do
   begin
      OnActivate := @CustomForm_Activate;
      OnShouldSkipPage := @CustomForm_ShouldSkipPage;
      OnBackButtonClick := @CustomForm_BackButtonClick;
      OnNextButtonClick := @CustomForm_NextButtonClick;
      OnCancelButtonClick := @CustomForm_CancelButtonClick;
   end;   

   Result := Page.ID;
end;

function OnDownloadProgress(const Url, FileName: String; const Progress, ProgressMax: Int64): Boolean;
begin
   LabelDownloading.Caption := ExpandConstant('{cm:Download_Form_LabelDownloading_Caption0}');
   ProgressBarDownload.Max := ProgressMax; 
   ProgressBarDownload.Position := Progress;
   Result := True;
end;

procedure Download_Form_Activate(Page: TWizardPage);
var
   ResultCode: Integer;
begin
   ProgressBarDownload.Position := 0;
   WizardForm.NextButton.Enabled := False;

   try
      DownloadTemporaryFile(URL, 'Setup_Driver.exe', '', @OnDownloadProgress);
   except
      Log(GetExceptionMessage);
   end;

   Exec(ExpandConstant('{tmp}\Setup_Driver.exe'), '', '', SW_SHOW, ewNoWait, ResultCode);

   WizardForm.NextButton.Enabled := True;
end;

function Download_Form_ShouldSkipPage(Page: TWizardPage): Boolean;
begin
   Result := False;
end;

function Download_Form_BackButtonClick(Page: TWizardPage): Boolean;
begin
   Result := True;
end;

function Download_Form_NextButtonClick(Page: TWizardPage): Boolean;
begin
   Result := True;
end;

procedure Download_Form_CancelButtonClick(Page: TWizardPage; var Cancel, Confirm: Boolean);
begin
   // enter code here...
end;

procedure Download_Form_CreatePage;
var
   Page: TWizardPage;
begin
   Page := PageFromId(wpInstalling);

   LabelDownloading := TLabel.Create(Page);
   with LabelDownloading do
   begin
      Parent := Page.Surface;
      Caption := ExpandConstant('{cm:Download_Form_LabelDownloading_Caption0}');
      Left := ScaleX(16);
      Top := ScaleY(36);
      Width := ScaleX(56);
      Height := ScaleY(13);
      Visible := True;
   end;

   ProgressBarDownload := TNewProgressBar.Create(Page);
   with ProgressBarDownload do
   begin
      Parent := Page.Surface;
      Left := ScaleX(16);
      Top := ScaleY(56);
      Width := ScaleX(382);
      Height := ScaleY(17);
      Min := 0;
      Max := 100;
   end;

   with Page do
   begin
      Caption := ExpandConstant('{cm:Download_Form_Caption}');
      Description := ExpandConstant('{cm:Download_Form_Description}')
      OnActivate := @Download_Form_Activate;
      OnShouldSkipPage := @Download_Form_ShouldSkipPage;
      OnBackButtonClick := @Download_Form_BackButtonClick;
      OnNextButtonClick := @Download_Form_NextButtonClick;
      OnCancelButtonClick := @Download_Form_CancelButtonClick;
   end;
end;

procedure InitializeWizard;
begin
   CustomForm_CreatePage(wpWelcome);
   Download_Form_CreatePage;
end;

function NextButtonClick(CurPageID: Integer): Boolean;
begin
   Result := True;
end;
