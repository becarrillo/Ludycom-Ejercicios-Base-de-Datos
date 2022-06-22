-- CURSORES EXPLÍCITOS
DECLARE
cursor e is
SELECT jobs.owner, argument_name, argument_position, jobs.argument_type, jobs.value, jobs.anydata_value, jobs.out_argument
FROM scheduler_job_args_tbl jobs
WHERE jobs.owner='base de datos';

v_owner scheduler_job_args_tbl.argument_type%type;
v_arg_name scheduler_job_args_tbl.argument_name%type;
v_arg_pos scheduler_job_args_tbl.argument_position%type;
v_arg_type scheduler_job_args_tbl.argument_type%type;
v_value scheduler_job_args_tbl.value%type;
v_any scheduler_job_args_tbl.anydata_value%type;
v_out_arg scheduler_job_args_tbl.out_argument%type;

BEGIN

OPEN e;

loop
    fetch e into v_owner, v_arg_name, v_arg_pos, v_arg_type, v_value, v_any, v_out_arg;
    exit WHEN e%notfound;
    dbms_output.put_line('owner: '||v_owner||' arg. name: '||v_arg_name||' arg. position: '||v_arg_pos||' arg. type: '||v_arg_type||' value: '||v_value||' anydata value: '||' out argument: '||v_out_arg);
end loop;

CLOSE e;

END;
