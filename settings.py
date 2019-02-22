import os.path

ROOT_DIR = 'T:/_DOC'
DOCAUTO_DIR = '_admin/doc_software/'
DEVELOPMENT_DIR = 'C:\MySandbox\docauto'
DOCAUTO_SW_DIR = DEVELOPMENT_DIR
# certs (CertificateSignature)
# graphic file with LET stamp for certificates
STAMP = os.path.join(ROOT_DIR, DOCAUTO_DIR, 'templates/LET stamp/Stempel L.E.T. Automotive NV.jpg')

# certs (Certificate)
# Default certificate template, when no other template is specified.
# DEFAULT_CERT_TEMPLATE = os.path.join(ROOT_DIR, DOCAUTO_DIR, 'templates/certs/CE_Cert-Template-3.docx')
# DEFAULT_CERT_TEMPLATE = os.path.join(ROOT_DIR, DOCAUTO_DIR, 'templates/certs/CE_Cert-Template-BarcodeTests.docx')
# DEFAULT_CERT_TEMPLATE = os.path.join(ROOT_DIR, DOCAUTO_DIR, 'templates/certs/CE_Cert-Template-4.docx')
# new heading with Vincotte
# DEFAULT_CERT_TEMPLATE = os.path.join(ROOT_DIR, DOCAUTO_DIR, 'templates/certs/CE_Cert-Template-5.docx')
# and higher resolution
# DEFAULT_CERT_TEMPLATE = os.path.join(ROOT_DIR, DOCAUTO_DIR, 'templates/certs/CE_Cert-Template-6.docx')
# 31.01.2017 - removed FAX number
DEFAULT_CERT_TEMPLATE = os.path.join(ROOT_DIR, DOCAUTO_DIR, 'templates/certs/CE_Cert-Template-7.docx')

# External Certificate Template
# 31.01.2017 - removed FAX number
EXTERNAL_CERT_TEMPLATE = os.path.join(ROOT_DIR, DOCAUTO_DIR, 'templates/certs/External_Cert-Template-5.docx')

# Attestation Certificate Template
# 31.01.2017 - removed FAX number
ATTESTATION_CERT_TEMPLATE = os.path.join(ROOT_DIR, DOCAUTO_DIR, 'templates/certs/Attestation-Template-7.docx')

# certs (Certificate)
# place on which written certs are to be stored
DEFAULT_OUTPUT_FOLDER = os.path.join(ROOT_DIR, '_pycerts')

# certs (CertificateDispatcher)
# Excel dictionary where the products/norms/languages are stored
DICT_EXCEL = IN_EXCEL_DICT = os.path.join(ROOT_DIR, DOCAUTO_DIR, 'etc/dict_tool.xlsx')

# certs (CertificateDispatcher)
# Folder for temporary file placement
TMP_DIR = os.path.join(ROOT_DIR, 'tmp')

# certs (ExtraTablesManager)
# Folder on which the extra_tables plugins are placed
XTABLES_PLUGINS_DIR = os.path.join(DOCAUTO_SW_DIR, 'pycerts/extra_tables')

# grab_backups
# Folder on which the firmware backups are placed for further analysis
BACKUPS_REPO = "T:/PRODUKTIE/SOFTWARE/Transfer/Backups"

# mk_index (Icons)
# Place on which the source icons are found for populating projects
#ICONS_REPO = os.path.join(ROOT_DIR, 'tmp')
ICONS_REPO = os.path.join(ROOT_DIR, DOCAUTO_DIR, 'templates/icons')

# read_dicts: Python output file on which the dictionary is placed once extracted from the source
DICTIONARY_PY = os.path.join(DOCAUTO_SW_DIR, 'dictionaries.py')

# tussenbladen: Path where the templates are stored
TUSSENBLADEN_TEMPLATE_PATH = os.path.join(ROOT_DIR, DOCAUTO_DIR, 'templates/tussenbladen')

# tussenbladen: Name of the tussenbladen template
# TUSSENBLADEN_TEMPLATE_FNAME = 'tussenbladen-template-v3.svg'
# TUSSENBLADEN_TEMPLATE_FNAME = 'tussenbladen-template-v5.svg'
TUSSENBLADEN_TEMPLATE_FNAME = 'tussenbladen-template-v6.svg'

# cds: templates
CDS_TEMPLATES_PATH = os.path.join(ROOT_DIR, DOCAUTO_DIR, 'templates/cds')

# certs: File extension for the certificates
DOCX_EXTENSION = 'docx'

# cds: Name of the datafile placed in the project folder containing the description of the CD output
CDS_DATAFILE = 'CD_Data.json'

# projects: template for certtool
#CERTTOOL_TEMPLATE = 'CertTool template - v8.xlsx'
# CERTTOOL_TEMPLATE = 'CertTool template - v9.xlsx'
CERTTOOL_TEMPLATE = 'CertTool template - v10.xlsx'

# SQLITE database which stores the cert requests ever issued to the dispatcher
REQUESTS_DB = os.path.join(ROOT_DIR, DOCAUTO_DIR, 'var/requests.db')

# OLD projects repository
OLD_PROJECTS_REPO = os.path.join(ROOT_DIR, 'zzz_COMPLETE PROJECTS')

# MINIGUI: executable location
MINIGUI = os.path.normpath(os.path.join(DEVELOPMENT_DIR, 'minigui.pyw'))

# PYTHON executable
PYTHON_EXE = os.path.normpath('c:\Python27\python.exe')
PYTHON_EXE = os.path.normpath('python.exe')

# MSWORD executable
MS_WORD_EXE = os.path.normpath('c:\Program Files (x86)\Microsoft Office\Office16\winword.exe')

# MSEXCEL executable
MS_EXCEL_EXE = os.path.normpath('c:\Program Files (x86)\Microsoft Office\Office16\excel.exe')

# LibreOffice / OpenOffice / StarOffice writer executable
SWRITER = os.path.normpath('C:/Program Files (x86)/LibreOffice 5/program/swriter.exe')

# # NRS user id on which name the inserts are to be done into the database
# NRS_USERID = 31

# Default validator. Name of person which appears in certificates
DEFAULT_VALIDATOR = "Peter Spiessens"

# Default PLA35 manuals descriptor
LM35_MANUAL_DESCRIPTOR = "170012_01-G4N01C"

# Non standard projects
NOT_STANDARD_PROJS = ('HEX-GO',)

# Scanned files folder: folder on which we drop the scanned certificates for further processing
SCANNED_CERTS_FOLDER = 'C:\MySandbox\scanned_certs'

# Where are the expansion rules for abbreviations stored
ABBREVIATION_RULES_XML = os.path.normpath('C:\\MySandbox\docauto\\abbreviation_rules.xml')

# Path to ImageMagick's convert
IM_CONVERT = os.path.normpath('t:\\_DOC\\_admin\\doc_software\\ImageMagick-7.0.3-1-portable-Q16-x64\\convert.exe')

# Path to ZBar zbarimg executable
ZBARIMG = os.path.normpath('t:\\_DOC\\_admin\\doc_software\\ZBar\\bin\\zbarimg.exe')
