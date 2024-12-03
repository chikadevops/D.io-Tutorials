# Creating AWS Resources With Functions & Introducing Arrays

We begin this project by creatin gtwo functions:
1. One for provisioning EC2 instances and,
2. Another for settin gup S3 buckets.

These functions will streamline the process of resource creation and enable us to automate tasks effectively.

### Function to provision EC2 instances

To programmatically create EC2 instances, you must use the [official documentation](https://docs.aws.amazon.com/cli/latest/reference/ec2/) to understand how to use the [aws cli to create instances.](https://docs.aws.amazon.com/cli/latest/reference/ec2/)

From the Available Commands, you will be able to interact with AWS programmatically.

![](./img/img01.png)

If you search for ***run-instances*** on the page with ***Ctrl + F*** on your keyboard, click on it and it will take you to the detailed documentation on the sub-command to create EC2 instances.

![](./img/img02.png)

Here is an example of ow you would create EC2 instances using the command line.

```
    aws ec2 run-instances \
        --image-id "ami-0cd59ecaf368e5ccf" \
        --instance-type "t2.micro" \
        --count 5 \
        --key-name MyKeyPair \
        --region eu-west-2
```

***Note:*** Make sure you have a key pair created in your aws console. Then you can replace the **"MyKeyPair"** with your key pair name.

On the same page, if you search for one of the arguments, you will be able to read more about how to pass different arguments to the cli.

![](./img/img03.png)

For the command to work, a keypair must already exist. You must create a keypair from the console.

Now lets update the shell script and create a function that will be responsible for creating EC2 instances.

```
#!/bin/bash

# Function to create EC2 instances

create_ec2_instances() \{

    # Specify the parameters for the EC2 instances
    instance_type="t2.micro"
    ami_id="ami-0cd59ecaf368e5ccf"  
    count=2  # Number of instances to create
    region="eu-west-2" # Region to create cloud resources
    
    # Create the EC2 instances
    aws ec2 run-instances \
        --image-id "$ami_id" \
        --instance-type "$instance_type" \
        --count $count
        --key-name MyKeyPair
        
    # Check if the EC2 instances were created successfully
    if [ $? -eq 0 ]; then
        echo "EC2 instances created successfully."
    else
        echo "Failed to create EC2 instances."
    fi
\}

# Call the function to create EC2 instances
create_ec2_instances
```

Lets highlight some new areas

* **$?:** This is a special variable that holds the exit status of the last executed command. In this case, it checks if the aws ec2 run-instances command was successful. exit status that equals 0 is interpreted as succesful. Therefore if exit code is "O", then echo the message to confirm that the previous command was successful.

* We have once again used environment variables to hold the value of ami_id, count and region and replaced with their respective values with $ami_id, $count and $region

### Define function to create S3 buckets & learn about Arrays

Before diving into creating S3 buckets, it's beneficial to brush up on AWS S3 bucket concepts. If you need a quick refresher, consider watching [this informative video.](https://www.youtube.com/watch?v=e6w9LwZJFIA)

The AWS CLI reference for S3 can be found [here.](https://docs.aws.amazon.com/cli/latest/reference/s3api/) We will be using it in the script.

In this section, our objective is to create five distinct $3 buckets, each designated for storing data related to Marketing, Sales, HR, Operations, and Media.

To achieve this, we'll utilize a fundamental data structure in shell scripting known as an "array." this is because, we need one single variable holding all the data, and then have the capability to loop through them.

***Arrays in Shell Scripting***

An array is a versatile data structure that allows you to store multiple values under a single variable name. Particularly in shell scripting, arrays offer an efficient means of managing collections of related data, making them invaluable for our task ahead.

Below is what the function woould look like.

```
# Function to create S3 buckets for different departments
create_s3_buckets() \{
    # Define a company name as prefix
    company="datawise"
    # Array of department names
    departments=("Marketing" "Sales" "HR" "Operations" "Media")
    
    # Loop through the array and create S3 buckets for each department
    for department in "$\{departments[@]\}"; do
        bucket_name="$\{company\}-$\{department\}-Data-Bucket"
        # Create S3 bucket using AWS CLI
        aws s3api create-bucket --bucket "$bucket_name" --region your-region
        if [ $? -eq 0 ]; then
            echo "S3 bucket '$bucket_name' created successfully."
        else
            echo "Failed to create S3 bucket '$bucket_name'."
        fi
    done
\}

# Call the function to create S3 buckets for different departments
create_s3_buckets
```

Let's break down each part of the code.

```
# Function to create S3 buckets for different departments
create_s3_buckets() \{
```

* This line begins the definition of a shell function names ***create_s3_buckets.***

```
# Define a company name as prefix
company="datawise"
```
* Here, we define a variable named company and assign it the value "datawise". This variable will serve as the prefix for all S3 bucket names, ensuring their uniqness. You should replace datawise with any other company name of your choice or any other unique identifier. this is because S3 buckets ***MUST*** be unique globally

```
  # Array of department names
  departments=("Marketing" "Sales" "HR" "Operations" "Media")
```

* This is where we define a variable that is an array. An array named ***departments*** is declared, containing the names of different departments. Each department name will be used to construct the name of an S3 bucket

`for department in "$\{departments[@]\}"; do`

* This line initiates a loop that iterates over each element in the departments array. For each iteration, the value of the current department name is stored in the variable ***department***

The syntax $\{departments[@]\} in Bash refers to all elements in the array departments.

[@]: This is an index or slice syntax specific to arrays in Bash. It signifies that we want to access all elements of the array.

If you were interested in accessing a single element from the array, you would still use the syntax $departments[index]\}, where index is the position of the element you want to access. Remember that array indexing in Bash starts from 0.

An example is;

```
departments=("Marketing" "Sales" "HR" "Operations" "Media")

# Accessing the fourth element (Operations) from the array
echo "$\{departments[3]\}"
```

`bucket_name="$\{company\}-$\{department\}-Data-Bucket"`

* Within the loop, we construct the name of the S3 bucket using the ***company prefix,*** the current ***department*** name, and the suffix ***"-Data-Bucket"***. This ensure that each bucket name is unique.

```
# Create S3 bucket using AWS CLI
aws s3api create-bucket --bucket "$bucket_name" --region your-region
```
* Using the AWS CLI (aws s3 api), we create an S3 bucket with the specified name from the variable ($bucket_name), in the specified AWS region (your-region). Make sure to replace ***"your region"*** with the actual AWS region where you want to create the buckets.

 `if [ $? -eq 0 ]; then`

This line checks the exit status of the previous command (aws s3api create-bucket). A value of 0 indicates success, while non-zero values indicate failure.

```
        echo "S3 bucket '$bucket_name' created successfully."
        else
            echo "Failed to create S3 bucket '$bucket_name'."
        fi
    done
```
* Based on the exit status of the aws s3api command, we print a corresponding message indicating whether the bucket creation was successful or not.

` \}`

**The complete script till this stage will now look like this:**

```
#!/bin/bash

# Environment variables
ENVIRONMENT=$1

check_num_of_args() \{
# Checking the number of arguments
if [ "$#" -ne 0 ]; then
    echo "Usage: $0 <environment>"
    exit 1
fi
\}

activate_infra_environment() \{
# Acting based on the argument value
if [ "$ENVIRONMENT" == "local" ]; then
  echo "Running script for Local Environment..."
elif [ "$ENVIRONMENT" == "testing" ]; then
  echo "Running script for Testing Environment..."
elif [ "$ENVIRONMENT" == "production" ]; then
  echo "Running script for Production Environment..."
else
  echo "Invalid environment specified. Please use 'local', 'testing', or 'production'."
  exit 2
fi
\}

# Function to check if AWS CLI is installed
check_aws_cli() \{
    if ! command -v aws &> /dev/null; then
        echo "AWS CLI is not installed. Please install it before proceeding."
        return 1
    fi
\}

# Function to check if AWS profile is set
check_aws_profile() \{
    if [ -z "$AWS_PROFILE" ]; then
        echo "AWS profile environment variable is not set."
        return 1
    fi
\}

# Function to create EC2 Instances
create_ec2_instances() \{

    # Specify the parameters for the EC2 instances
    instance_type="t2.micro"
    ami_id="ami-0cd59ecaf368e5ccf"  
    count=2  # Number of instances to create
    region="eu-west-2" # Region to create cloud resources
    
    # Create the EC2 instances
    aws ec2 run-instances \
        --image-id "$ami_id" \
        --instance-type "$instance_type" \
        --count $count
        --key-name MyKeyPair
        
    # Check if the EC2 instances were created successfully
    if [ $? -eq 0 ]; then
        echo "EC2 instances created successfully."
    else
        echo "Failed to create EC2 instances."
    fi
\}

# Function to create S3 buckets for different departments
create_s3_buckets() \{
    # Define a company name as prefix
    company="datawise"
    # Array of department names
    departments=("Marketing" "Sales" "HR" "Operations" "Media")
    
    # Loop through the array and create S3 buckets for each department
    for department in "$\{departments[@]\}"; do
        bucket_name="$\{company\}-$\{department\}-Data-Bucket"
        # Create S3 bucket using AWS CLI
        aws s3api create-bucket --bucket "$bucket_name" --region your-region
        if [ $? -eq 0 ]; then
            echo "S3 bucket '$bucket_name' created successfully."
        else
            echo "Failed to create S3 bucket '$bucket_name'."
        fi
    done
\}

check_num_of_args
activate_infra_environment
check_aws_cli
check_aws_profile
create_ec2_instances
create_s3_buckets
```

Congratulations for reaching this milestone.
