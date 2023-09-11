# PowerBeam (Hyperbeam) Automation Scripts

This repository contains a set of PowerShell scripts designed to interact with the Hyperbeam API. These scripts automate various tasks like initiating sessions, terminating them, and opening embedded URLs.

## Scripts

1. **powerbeam_start.ps1**: Sends a POST request to the Hyperbeam API to start a session. The response, including the session ID and embed URL, is saved to a `response.json` file and opening the session on the standard browser.
2. **powerbeam_disable.ps1**: Reads the session ID from the saved `response.json` file and sends a DELETE request to terminate the session.

## Prerequisites

- PowerShell
- `HYPERBEAM_API_KEY` set as an environment variable. This is your API key for the Hyperbeam service.

## Setting up the Environment Variable

For a temporary setup (current session only):
```powershell
$env:HYPERBEAM_API_KEY = "YOUR_API_KEY_HERE"
```

For a permanent setup, refer to the system's environment variable settings.

## Usage

1. Clone the repository:
   ```bash
   git clone https://github.com/YOUR_GITHUB_USERNAME/PowerBeam.git
   ```

2. Navigate to the project directory:
   ```bash
   cd PowerBeam
   ```

3. Run the desired script:
   ```powershell
   .\powerbeam_start.ps1
   ```

## Disabling the session (Very important!)

Please bear in mind that production sessions using Hyperbeam have a limit of 10000 minutes per month, so it is crucial to disable the session when you are done using the hyperbeam browser.

In order to terminate the session, simply run:
```powershell
   .\powerbeam_disable.ps1
```

Confirm that the session was terminated by reading the response message on the screen

## Safety and Security

Please ensure your API key remains confidential. Do not hard-code it in scripts or expose it in public repositories. Always store it securely, preferably using environment variables or secret management tools.

## Contribution

Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

## License

[MIT](https://choosealicense.com/licenses/mit/)
