param
(
    [parameter(Mandatory = $true)] [String] $source_branch,
    [parameter(Mandatory = $true)] [String] $root_path,
    [parameter(Mandatory = $true)] [String] $doc_param_path
)

# specify path to mount to docker
$mount_path = $root_path + ":/module"

# target file
$out_file = $root_path + "/README.md"

$param_file = $doc_param_path + "/terraform-docs-params.yml"

$header_file = $doc_param_path + "/header.md"


# to generate markdown documentation 
docker run -v $mount_path -a stdout quay.io/terraform-docs/terraform-docs:latest -c $param_file --header-from $header_file  /module > $out_file

# git config
git config user.name "AzureDevOps agent"

Write-Output "CHECK GIT STATUS..."
git status

# add generated file to git commit
git add $out_file

# commit changes
Write-Output "Commiting the changes..."
git commit -m "***NO_CI***"
git status

# sync changes to repo
Write-Output "Pushing the changes..."
git push origin HEAD:$source_branch
Write-Output "Customization Committed Successfully"