import os
from kaggle.api.kaggle_api_extended import KaggleApi

# ========== CONFIGURAÇÕES ==========
KAGGLE_DATASET = 'olistbr/brazilian-ecommerce'
KAGGLE_FILE = 'olist_orders_dataset.csv'
LOCAL_DOWNLOAD_PATH = 'C:/Users/luizf/OneDrive/Documentos/temp' # local de download do arquivo que é o equivalente a uma pasta /tmp
HDFS_DEST_PATH = 'C:/Users/luizf/OneDrive/Documentos/temp/olist_orders_dataset.csv'  # caminho no HDFS

# ========== AUTENTICAÇÃO ==========
api = KaggleApi()
api.authenticate()

# ========== EXTRAÇÃO ==========
os.makedirs(LOCAL_DOWNLOAD_PATH, exist_ok=True)
print("Baixando dataset do Kaggle...")
api.dataset_download_files(KAGGLE_DATASET, path=LOCAL_DOWNLOAD_PATH, unzip=True)
