from llama_index import VectorStoreIndex, SimpleDirectoryReader

query = "What happened in Bucha?"

documents = SimpleDirectoryReader('data').load_data()
index = VectorStoreIndex.from_documents(documents)

query_engine = index.as_query_engine()
query_response = query_engine.query(query)

print(query_response.response)
