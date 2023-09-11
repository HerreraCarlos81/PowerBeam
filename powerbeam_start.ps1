# Fetch the API key from the environment variable
$apiKey = $env:HYPERBEAM_API_KEY

# Check if the API key is present
if (-not $apiKey) {
    Write-Error "Environment variable HYPERBEAM_API_KEY is not set."
    exit 1
}

# Define the API endpoint and headers
$uri = "https://engine.hyperbeam.com/v0/vm"
$headers = @{
    'Authorization' = "Bearer $apiKey"
}

# Send the POST request and save the response
$response = Invoke-RestMethod -Uri $uri -Method POST -Headers $headers

# Write the response to a file in the same directory
$response | ConvertTo-Json -Depth 100 | Set-Content -Path ".\response.json"

# Load the JSON response from the file
$jsonContent = Get-Content -Path ".\response.json" | ConvertFrom-Json

# Fetch the embed URL from the JSON content
$embedUrl = $jsonContent.embed_url

# Open the embed URL in the default browser
Start-Process $embedUrl