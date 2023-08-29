from fastapi import FastAPI
from llama_index import VectorStoreIndex, SimpleDirectoryReader

app = FastAPI()
documents = SimpleDirectoryReader('data').load_data()
index = VectorStoreIndex.from_documents(documents)

query_engine = index.as_query_engine()


@app.get("/")
def read_root(query: str):
    response = query_engine.query(query)
    return {"res": response.response}
