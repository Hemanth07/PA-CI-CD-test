This is a sample nodejs express app based on
http://expressjs.com/en/starter/hello-world.html

To configure:

* install https://nodejs.org/en/ (we tested with v6.9.1)
* `npm install`
* edit `config.json` to change the message or port as needed

To start the app:

```
node app.js
```

# How to
#### local testing
* build the docker image `docker build -t <image_name>:<tag_name> .`

* run the contianer `docker container run -p 80:8080 <image_name>:<tag_name>`

I choose docker due to the following reasons:
    1. easily shippable 
    2. testing made easy 
    3. carry out the same working env across multiple stages
---

## In production 

1. build the image via jenkins/codebild-pipeline.
2. push it to artifactory or any private registries.
3. pull to any COE(Container Orchestration Engines).
4. Run the container.

## Mu-Stelligent

`https://getmu.io/`

This tool helps us to reduce the creation of cloudformation code, if we want to 
deploy container ASAP for quick demos and testing, for production we want to tweak the
IAM roles, loadbalancer rules and some other configurations.

* The `mu.yaml` is the base config file for load-balancer ports.
* The `buildspec.yml` is providing the build context.

```Make sure you have the GitHub AccessToken ready for the codepipeline, GitLab etc.. are not supported yet```

## Mu Instructions

This is very cool tool developed by stelligent, I recommended stelligent tools for developers to qickly deploy and test code.
in the crash and burn aws-env accounts

#### Installation => https://github.com/stelligent/mu
* `cd into the cloned repo`
* configure your cli with aws-creds
* `mu pipeline up` => initiate the pipeline 
* `mu svc show` => check the status
* ` login to the aws console, and approve the code-pipeline manual step`
* `mu env show acceptance` for acceptance env ALB url
* `mu env show production` for production env ALB url