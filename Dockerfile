FROM ubuntu:latest

# Install required packages
RUN apt-get update && apt-get install -y curl jq

#Set the environment variable for the city
ENV CITY_NAME="London"

# Set the environment variable for the API key
ENV API_KEY="a11780d968a24e6596b174718230507"

# Run the script and echo the temperature of the specified city
CMD bash -c ' \
    API_ENDPOINT="https://api.weatherapi.com/v1/current.json"; \
    CITY="${CITY_NAME}"; \
    \
    # Make an API request to fetch the weather data \
    response=$(curl -s "$API_ENDPOINT?key=$API_KEY&q=$CITY"); \
    \
    # Parse the temperature from the JSON response \
    temperature=$(echo "$response" | jq -r ".current.temp_c"); \
    \
    # Echo the temperature of the specified city \
    echo "La temperatura en $CITY es $temperature grados.";  \
    '