package test

import (
	"testing"

	"github.com/gruntwork-io/terratest/modules/terraform"
	"github.com/stretchr/testify/assert"
)

func TestTerraformAzureExample(t *testing.T) {
	t.Parallel()

	terraformOptions := &terraform.Options{
		// The path to where our Terraform code is located
		TerraformDir: "../",
		Vars: map[string]interface{}{
			"geozone":           "France Central",
			"client":            "AB9",
			"budget":            "RU6547",
			"project":           "6666",
			"rgpd_personal":     true,
			"rgpd_confidential": true,
		},
	}

	defer terraform.Destroy(t, terraformOptions)

	terraform.InitAndApply(t, terraformOptions)

	tags := terraform.OutputMapOfObjects(t, terraformOptions, "tags")

	client_tag := tags["U_CLIENT"]
	assert.Equal(t, client_tag, "AB9")

	project_tag := tags["U_PROJECT"]
	assert.Equal(t, project_tag, "6666")

	region_tag := tags["U_REGION"]
	assert.Equal(t, region_tag, "FRANCE")

	budget_tag := tags["U_BUDGET"]
	assert.Equal(t, budget_tag, "RU6547")

	rgpd_tag := tags["U_RGPD"]
	assert.Equal(t, rgpd_tag, "CONFIDENTIAL")
}
