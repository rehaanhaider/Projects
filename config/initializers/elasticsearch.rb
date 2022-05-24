Elasticsearch::Client.new(
  url: 'https://elastic:8TM7--WDVeECMukEXBEe@localhost:9200',
  transport_options: {
	ssl: { ca_file: 'http_ca.crt' }
  }
)