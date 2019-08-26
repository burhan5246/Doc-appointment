<?php


namespace App\Http\Controllers\API;


use Illuminate\Http\Request;
use App\Http\Controllers\API\APIBaseController as APIBaseController;
use Illuminate\Support\Facades\Crypt;
use App\Appointment;
use App\Clinic;
use App\Doctor;
use App\User;
use App\Token;
use DB;
use Hash;
use Validator;
use Socialite;



class APIController extends APIBaseController
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */

    public function adminLogin(Request $request)
    {
        $users = User::select('id', 'is_admin', 'username')
                 ->where('username', $request->username)
                 ->where('password', $request->password);                  
           if($users->count() > 0){
                 $result =  $users->first();
                 return $this->sendResponse($result, 'successfully.');
             }else{
                 return $this->sendError('Wrong credentials');
             }

          /*$string = $request->password;
            $encrypted = Crypt::encrypt($string);
            $decrypted_string = Crypt::decrypt($encrypted);
            die($encrypted."<br>".$decrypted_string); */ 

    }


    public function createClinic(Request $request)
    {
        try{
        $input = $request->all();
        $user = new User;
        $user->name = $request->owner_name;
        $user->username = $request->username;
        $user->password = $request->password;
        $user->email = $request->email;
        $user->save();
        $user_id = $user->id;

        $clinic = new Clinic;
        $clinic->user_id = $user_id;
        $clinic->name = $request->clinic_name;
        $clinic->address = $request->clinic_add;
        $clinic->city = $request->city;
        $clinic->state = $request->state_name;
        $clinic->country = $request->country;
        $clinic->save();
        $clinic_id = $clinic->id; 
        return $this->sendResponse($input, 'Created successfully.');
            
        }catch (\Illuminate\Database\QueryException $e) {

         return $this->sendError($e->errorInfo[2], $errorMessages = [], 200);   
        }       

    }

    public function ClinicList()
    {
        $list = Clinic::join('users', 'clinics.user_id', '=', 'users.id')
            ->select('users.name as owner_name', 'clinics.name', 'users.username', 'users.password', 'users.email', 'clinics.city', 'clinics.id', 'clinics.user_id')
            ->get();
        return $this->sendResponse($list->toArray(), 'Posts retrieved successfully.');
    }

       public function ClinicShow($id)
    {
        $list = DB::table('clinics')
            ->join('users', 'clinics.user_id', '=', 'users.id')
            ->where('clinics.id', $id)
            ->select('users.name as owner_name', 'clinics.name as clinic_name', 'users.username', 'users.password', 'users.email', 'clinics.city', 'clinics.id', 'clinics.user_id', 'clinics.address as clinic_add', 'clinics.state as state_name', 'clinics.country')
            ->first();
        return $this->sendResponse($list, 'retrieved successfully.');
    }

    public function ClinicDelete($id)
    {
        $user = User::find($id);
        $clinic = Clinic::where('user_id', $id);
        if (empty($user) || empty($clinic)) 
        {
            return $this->sendError('Not found.');
        }
        $user->delete();
        $clinic->delete();
        return $this->sendResponse($id, 'Deleted successfully.');
    }

    public function ClinicUpdate(Request $request)
    {
        $user = User::find($request->user_id);
        $clinic = Clinic::find($request->id);


        $user->name = $request->owner_name;
        $user->username = $request->username;
        $user->password = $request->password;
        $user->email = $request->email;

        $clinic->name = $request->clinic_name;
        $clinic->address = $request->clinic_add;
        $clinic->city = $request->city;
        $clinic->state = $request->state_name;
        $clinic->country = $request->country;

        if (empty($user) || empty($clinic)) 
        {
            return $this->sendError('Not found.');
        }
        $user->save();
        $clinic->save();
        return $this->sendResponse($request->all(), 'Updated successfully.');
    }

    public function CreateDoctor(Request $request)
    {
        
        $input = $request->all();
        $doctor = new Doctor;
        $doctor->user_id = $request->user_id;
        $doctor->doc_name = $request->doc_name;
        $doctor->mob = $request->mob;
        $doctor->email = $request->email;
        $doctor->specialist_in = $request->specialist_in;
        //$doctor->save();        
        if($doctor->save()){
            return $this->sendResponse($input, 'Created successfully.');
            
        }else {

            return $this->sendError('Something went wrong', $errorMessages = [], 200);   
        }       

    }

    public function ListDoctor($id)
    {
        $doclist = Doctor::select('id', 'doc_name', 'mob', 'email', 'specialist_in')
                   ->where('user_id',$id)->get();
                    
        if (empty($doclist)) {
            return $this->sendError('Not found.', $errorMessages = [], 200);
        }


            return $this->sendResponse($doclist, 'Retrieved successfully.');
    }

    public function DoctorDelete($id)
    {
        $doc = Doctor::find($id);
        if (empty($doc)) 
        {
           return $this->sendError('Not found.');
        }
        $doc->delete();
           return $this->sendResponse($id, 'Deleted successfully.');
    }

    public function DoctorUpdate(Request $request)
    {
        $doc = Doctor::find($request->id);
        
        $doc->doc_name = $request->doc_name;
        $doc->mob = $request->mob;
        $doc->email = $request->email;
        $doc->specialist_in = $request->specialist_in;

        if (empty($doc)) 
        {
            return $this->sendError('Not found.');
        }
        $doc->save();
            return $this->sendResponse($request, 'Updated successfully.');
    }

       public function DoctorShow($id)
    {
        $doc = Doctor::find($id);
        if (empty($doc))
        {
           return $this->sendError('Not found.');
        }


        return $this->sendResponse($doc->toArray(), 'Retrieved successfully.');
    }


 
       public function CreateAppointment(Request $request)
    {
        try{
        
        $table = new Appointment;
        $table->doc_id = $request->doc_id;
        $table->user_id = $request->user_id;
        $table->name = $request->patient_name;
        $table->mobile = $request->mob;
        $table->email = $request->email;
        $table->gender = $request->gender;
        $table->age = $request->age;
        $table->address = $request->address;
        $table->city = $request->city;
        $table->state = $request->state_name;
        $table->country = $request->country;
        $table->save();
        $appointment_id = $table->id;

         $count = Appointment::where('user_id', $request->user_id)
                             ->where('created_at', date("Y-m-d"))
                             ->count();

                             $number = "";
                             if($count){
                             	$number = sprintf('%02d', $count);
                             }
        $generated_token = $number."-D".$request->doc_id."-C".$request->user_id."-".date("jS F Y h:i:s A");

        $token = new Token;
        $token->appointment_id = $appointment_id;
        $token->token =   $generated_token;      
        $token->save();
        $token_id = $token->id; 
        return $this->sendResponse($generated_token, 'Created successfully.');
            
        }catch (\Illuminate\Database\QueryException $e) {

         return $this->sendError($e->errorInfo[2], $errorMessages = [], 200);   
        }       

    }

    public function AppointmentList($id)
    {
        $list = Appointment::join('doctors', 'appointments.doc_id', '=', 'doctors.id')
                ->join('tokens', 'appointments.id', '=', 'tokens.appointment_id')
                ->where('appointments.user_id', $id)    
                ->select('appointments.created_at', 'appointments.attended', 'appointments.id', 'appointments.name', 'appointments.age', 'tokens.token', 'doctors.doc_name')
                ->get();
        return $this->sendResponse($list->toArray(), 'retrieved successfully.');
    }

     public function AppointmentListFilter($getDate, $userid)
    {
        //$getDate = $request->$getDate;
        $getDate = explode(" - ", $getDate);
        $list = Appointment::join('doctors', 'appointments.doc_id', '=', 'doctors.id')
                ->join('tokens', 'appointments.id', '=', 'tokens.appointment_id')
                ->where('appointments.user_id', $userid)
                //->limit(2)
                ->whereBetween('appointments.created_at', array($getDate[0], $getDate[1]))    
                ->select('appointments.created_at', 'appointments.attended', 'appointments.id', 'appointments.name', 'appointments.age', 'tokens.token', 'doctors.doc_name')
                ->get();
        return $this->sendResponse($list->toArray(), 'retrieved successfully.');
    }

    public function Attendend($id)
    {

        $table = Appointment::find($id);
        if (empty($table)) 
        {
            return $this->sendError('Not found.');
        }       
        $table->attended = 1;
        $table->save();
        return $this->sendResponse($id, 'Updated successfully.');
    }

    public function todayAppointmentList($id)
    {
       $date = date("Y-m-d");
        //$list = Appointment::leftjoin('doctors', 'appointments.doc_id', '=', 'doctors.id')
        $list = DB::table('appointments')
                ->leftjoin('doctors', 'appointments.doc_id', '=', 'doctors.id')
                ->join('tokens', 'appointments.id', '=', 'tokens.appointment_id')
                ->where('appointments.user_id', $id)
                ->where('appointments.created_at', $date)
                ->orderBy('id', 'DESC')    
                ->select('appointments.created_at', 'appointments.attended', 'appointments.id', 'appointments.name', 'appointments.age', 'tokens.token', 'doctors.doc_name')
                ->get();
        return $this->sendResponse($list->toArray(), 'retrieved successfully.');
    }



}