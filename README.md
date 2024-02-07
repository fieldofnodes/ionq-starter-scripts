# IonQ 

This is a sample repository to show a basic usage of the RESTapi and the IonQ simulator backend. The acess is used with `bash` and has been developed on Unix.

It is assumed the user will have an API from IonQ and saved as-is in a file called:`api-key.txt`. 

Asumed folder directory 
```
ionq-starter-scripts
├── api-key.txt # Not in repository
├── ghz-job.json # Sample from IonQ docs
└── job_submit_check.sh # Bash script
```

In a terminal 

```
$USER@ionq-starter-scripts$ bash ./job_submit_check.sh ghz-job.json
```

**Note**
The user should be able to submit the absolute path for the given scripts. This has been tested with `json` based job.

Outputs should look like

```
Submitting job for ghz-job.json
...
Job submitted with ID: 74aeec2e-9d97-4f77-8052-7f4155b913bc

...
Sleep 5 seconds to allow job to start

Getting results

Job results: {"0": 0.4296875, "1": 0.0068359375, "2": 0.029296875, "3": 0.0146484375, "4": 0.0283203125, "5": 0.02734375, "6": 0.01171875, "7": 0.4521484375}
```

This is the current progress. Will update.
