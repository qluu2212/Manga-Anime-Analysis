from dagster_dbt import dbt_assets, DbtProject, DbtCliResource
from pathlib import Path
from dagster import file_relative_path, AssetExecutionContext, Definitions

dbt_project = DbtProject(
    project_dir=Path(file_relative_path(__file__, "../anime_manga")),
)

dbt_resource = DbtCliResource(
    project_dir=Path(file_relative_path(__file__, "../anime_manga")),
    profiles_dir=Path(file_relative_path(__file__, "../anime_manga")),
)

@dbt_assets(
    manifest=dbt_project.manifest_path,
)
def dbt_analytics(context: AssetExecutionContext, dbt: DbtCliResource):
    yield from dbt.cli(["build"], context=context).stream()

defs = Definitions(
    assets=[dbt_analytics],
    resources={
        "dbt": dbt_resource
    }
)