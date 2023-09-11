# Fetch the API key from the environment variable
$apiKey = $env:HYPERBEAM_API_KEY

# Check if the API key is present
if (-not $apiKey) {
    Write-Error "Environment variable HYPERBEAM_API_KEY is not set."
    exit 1
}

# Load the JSON response from the file
$jsonContent = Get-Content -Path ".\response.json" | ConvertFrom-Json

# Fetch the session ID from the JSON content
$sessionId = $jsonContent.session_id

# Define the API endpoint with the session ID
$uri = "https://engine.hyperbeam.com/v0/vm/$sessionId"
$headers = @{
    'Authorization' = "Bearer $apiKey"
}

# Send the DELETE request to terminate the session
Invoke-RestMethod -Uri $uri -Method DELETE -Headers $headers

# Delete the response.json file
Remove-Item -Path ".\response.json" -Force

Write-Output "Session terminated successfully."