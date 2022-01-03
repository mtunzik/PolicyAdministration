PGDMP          #                y            PolicyAdmin    13.2    13.2 �    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    16394    PolicyAdmin    DATABASE     X   CREATE DATABASE "PolicyAdmin" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'C';
    DROP DATABASE "PolicyAdmin";
                postgres    false            �            1259    33362    accounts_paymentledger    TABLE     �   CREATE TABLE public.accounts_paymentledger (
    id bigint NOT NULL,
    "PolicyLedger_id" bigint NOT NULL,
    "Receipt_id" bigint NOT NULL,
    "Amount" numeric(8,2)
);
 *   DROP TABLE public.accounts_paymentledger;
       public         heap    postgres    false            �            1259    33360    accounts_paymentledger_id_seq    SEQUENCE     �   CREATE SEQUENCE public.accounts_paymentledger_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 4   DROP SEQUENCE public.accounts_paymentledger_id_seq;
       public          postgres    false    236            �           0    0    accounts_paymentledger_id_seq    SEQUENCE OWNED BY     _   ALTER SEQUENCE public.accounts_paymentledger_id_seq OWNED BY public.accounts_paymentledger.id;
          public          postgres    false    235            �            1259    33354    accounts_receipt    TABLE     �   CREATE TABLE public.accounts_receipt (
    id bigint NOT NULL,
    "Amount" numeric(8,2),
    "Date" date NOT NULL,
    "PaymentMethod" character varying(20),
    "Client_id" bigint NOT NULL
);
 $   DROP TABLE public.accounts_receipt;
       public         heap    postgres    false            �            1259    33352    accounts_receipt_id_seq    SEQUENCE     �   CREATE SEQUENCE public.accounts_receipt_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.accounts_receipt_id_seq;
       public          postgres    false    234            �           0    0    accounts_receipt_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.accounts_receipt_id_seq OWNED BY public.accounts_receipt.id;
          public          postgres    false    233            �            1259    16427 
   auth_group    TABLE     f   CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);
    DROP TABLE public.auth_group;
       public         heap    postgres    false            �            1259    16425    auth_group_id_seq    SEQUENCE     �   CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.auth_group_id_seq;
       public          postgres    false    207            �           0    0    auth_group_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;
          public          postgres    false    206            �            1259    16437    auth_group_permissions    TABLE     �   CREATE TABLE public.auth_group_permissions (
    id bigint NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);
 *   DROP TABLE public.auth_group_permissions;
       public         heap    postgres    false            �            1259    16435    auth_group_permissions_id_seq    SEQUENCE     �   CREATE SEQUENCE public.auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 4   DROP SEQUENCE public.auth_group_permissions_id_seq;
       public          postgres    false    209            �           0    0    auth_group_permissions_id_seq    SEQUENCE OWNED BY     _   ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;
          public          postgres    false    208            �            1259    16419    auth_permission    TABLE     �   CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);
 #   DROP TABLE public.auth_permission;
       public         heap    postgres    false            �            1259    16417    auth_permission_id_seq    SEQUENCE     �   CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.auth_permission_id_seq;
       public          postgres    false    205            �           0    0    auth_permission_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;
          public          postgres    false    204            �            1259    16445 	   auth_user    TABLE     �  CREATE TABLE public.auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(150) NOT NULL,
    last_name character varying(150) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);
    DROP TABLE public.auth_user;
       public         heap    postgres    false            �            1259    16455    auth_user_groups    TABLE     ~   CREATE TABLE public.auth_user_groups (
    id bigint NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);
 $   DROP TABLE public.auth_user_groups;
       public         heap    postgres    false            �            1259    16453    auth_user_groups_id_seq    SEQUENCE     �   CREATE SEQUENCE public.auth_user_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.auth_user_groups_id_seq;
       public          postgres    false    213            �           0    0    auth_user_groups_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.auth_user_groups_id_seq OWNED BY public.auth_user_groups.id;
          public          postgres    false    212            �            1259    16443    auth_user_id_seq    SEQUENCE     �   CREATE SEQUENCE public.auth_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.auth_user_id_seq;
       public          postgres    false    211            �           0    0    auth_user_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.auth_user_id_seq OWNED BY public.auth_user.id;
          public          postgres    false    210            �            1259    16463    auth_user_user_permissions    TABLE     �   CREATE TABLE public.auth_user_user_permissions (
    id bigint NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);
 .   DROP TABLE public.auth_user_user_permissions;
       public         heap    postgres    false            �            1259    16461 !   auth_user_user_permissions_id_seq    SEQUENCE     �   CREATE SEQUENCE public.auth_user_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 8   DROP SEQUENCE public.auth_user_user_permissions_id_seq;
       public          postgres    false    215            �           0    0 !   auth_user_user_permissions_id_seq    SEQUENCE OWNED BY     g   ALTER SEQUENCE public.auth_user_user_permissions_id_seq OWNED BY public.auth_user_user_permissions.id;
          public          postgres    false    214            �            1259    16556    clients_client    TABLE     �  CREATE TABLE public.clients_client (
    id bigint NOT NULL,
    "First_Name" character varying(250) NOT NULL,
    "Last_Name" character varying(250) NOT NULL,
    "Cell_Number" character varying(12),
    "Email" character varying(254),
    "Gender" character varying(6),
    "ID_Number" character varying(20),
    "ID_Type" character varying(10),
    "Telephone" character varying(12),
    "Title" character varying(10),
    "DateAdded" timestamp with time zone NOT NULL,
    "DateOfBirth" date NOT NULL,
    "CreatedBy_id" integer,
    "DateUpdated" timestamp with time zone NOT NULL,
    "IsDeleted" boolean NOT NULL,
    "UpdatedBy_id" integer
);
 "   DROP TABLE public.clients_client;
       public         heap    postgres    false            �            1259    16554    clients_client_id_seq    SEQUENCE     ~   CREATE SEQUENCE public.clients_client_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.clients_client_id_seq;
       public          postgres    false    219            �           0    0    clients_client_id_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public.clients_client_id_seq OWNED BY public.clients_client.id;
          public          postgres    false    218            �            1259    16523    django_admin_log    TABLE     �  CREATE TABLE public.django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id integer NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);
 $   DROP TABLE public.django_admin_log;
       public         heap    postgres    false            �            1259    16521    django_admin_log_id_seq    SEQUENCE     �   CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.django_admin_log_id_seq;
       public          postgres    false    217            �           0    0    django_admin_log_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;
          public          postgres    false    216            �            1259    16409    django_content_type    TABLE     �   CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);
 '   DROP TABLE public.django_content_type;
       public         heap    postgres    false            �            1259    16407    django_content_type_id_seq    SEQUENCE     �   CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public.django_content_type_id_seq;
       public          postgres    false    203            �           0    0    django_content_type_id_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;
          public          postgres    false    202            �            1259    16398    django_migrations    TABLE     �   CREATE TABLE public.django_migrations (
    id bigint NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);
 %   DROP TABLE public.django_migrations;
       public         heap    postgres    false            �            1259    16396    django_migrations_id_seq    SEQUENCE     �   CREATE SEQUENCE public.django_migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.django_migrations_id_seq;
       public          postgres    false    201            �           0    0    django_migrations_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;
          public          postgres    false    200            �            1259    16565    django_session    TABLE     �   CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);
 "   DROP TABLE public.django_session;
       public         heap    postgres    false            �            1259    16914    policy_policy    TABLE     *  CREATE TABLE public.policy_policy (
    id bigint NOT NULL,
    "Number" character varying(20) NOT NULL,
    "InceptionDate" date NOT NULL,
    "CollectionDay" integer NOT NULL,
    "DateAdded" timestamp with time zone NOT NULL,
    "Client_id" bigint NOT NULL,
    "Product_id" bigint NOT NULL
);
 !   DROP TABLE public.policy_policy;
       public         heap    postgres    false            �            1259    16912    policy_policy_id_seq    SEQUENCE     }   CREATE SEQUENCE public.policy_policy_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.policy_policy_id_seq;
       public          postgres    false    226            �           0    0    policy_policy_id_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.policy_policy_id_seq OWNED BY public.policy_policy.id;
          public          postgres    false    225            �            1259    16944    policy_policyledger    TABLE     �   CREATE TABLE public.policy_policyledger (
    id bigint NOT NULL,
    "Amount" numeric(8,2),
    "TransactionDate" date NOT NULL,
    "CollectionDate" date NOT NULL,
    "PolicyVersion_id" bigint NOT NULL
);
 '   DROP TABLE public.policy_policyledger;
       public         heap    postgres    false            �            1259    16942    policy_policyledger_id_seq    SEQUENCE     �   CREATE SEQUENCE public.policy_policyledger_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public.policy_policyledger_id_seq;
       public          postgres    false    232            �           0    0    policy_policyledger_id_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public.policy_policyledger_id_seq OWNED BY public.policy_policyledger.id;
          public          postgres    false    231            �            1259    16933    policy_policymembers    TABLE     f  CREATE TABLE public.policy_policymembers (
    id bigint NOT NULL,
    "MemberType" character varying(20) NOT NULL,
    "First_Name" character varying(250) NOT NULL,
    "Last_Name" character varying(250) NOT NULL,
    "Gender" character varying(6),
    "DateOfBirth" date NOT NULL,
    "ID_Type" character varying(10),
    "ID_Number" character varying(20),
    "Title" character varying(10),
    "Student" boolean,
    "DateAdded" timestamp with time zone NOT NULL,
    "PolicyVersion_id" bigint NOT NULL,
    "Premium" numeric(8,2) NOT NULL,
    "Cover" character varying(50),
    "CoverAmount" numeric(8,2)
);
 (   DROP TABLE public.policy_policymembers;
       public         heap    postgres    false            �            1259    16931    policy_policymembers_id_seq    SEQUENCE     �   CREATE SEQUENCE public.policy_policymembers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 2   DROP SEQUENCE public.policy_policymembers_id_seq;
       public          postgres    false    230            �           0    0    policy_policymembers_id_seq    SEQUENCE OWNED BY     [   ALTER SEQUENCE public.policy_policymembers_id_seq OWNED BY public.policy_policymembers.id;
          public          postgres    false    229            �            1259    16922    policy_policyversion    TABLE     �  CREATE TABLE public.policy_policyversion (
    id bigint NOT NULL,
    "EndorsementType" character varying(20) NOT NULL,
    "EndorsementReason" character varying(255) NOT NULL,
    "EffectiveDateFrom" date NOT NULL,
    "EffectiveDateTo" date NOT NULL,
    "Description" character varying(255) NOT NULL,
    "Cover" character varying(50),
    "DateAdded" timestamp with time zone NOT NULL,
    "Policy_id" bigint NOT NULL,
    "IsLatest" boolean NOT NULL,
    "Status" character varying(20) NOT NULL,
    "Version_Number" integer NOT NULL,
    "CoverAmount" numeric(8,2),
    "ApprovedBy_id" integer,
    "CreatedBy_id" integer NOT NULL,
    "DeclinedBy_id" integer
);
 (   DROP TABLE public.policy_policyversion;
       public         heap    postgres    false            �            1259    16920    policy_policyversion_id_seq    SEQUENCE     �   CREATE SEQUENCE public.policy_policyversion_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 2   DROP SEQUENCE public.policy_policyversion_id_seq;
       public          postgres    false    228            �           0    0    policy_policyversion_id_seq    SEQUENCE OWNED BY     [   ALTER SEQUENCE public.policy_policyversion_id_seq OWNED BY public.policy_policyversion.id;
          public          postgres    false    227            �            1259    16577    products_product    TABLE     �   CREATE TABLE public.products_product (
    id bigint NOT NULL,
    "Name" character varying(255) NOT NULL,
    "Code" character varying(10) NOT NULL,
    "DateAdded" timestamp with time zone NOT NULL,
    "isActive" boolean NOT NULL
);
 $   DROP TABLE public.products_product;
       public         heap    postgres    false            �            1259    16575    products_product_id_seq    SEQUENCE     �   CREATE SEQUENCE public.products_product_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.products_product_id_seq;
       public          postgres    false    222            �           0    0    products_product_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.products_product_id_seq OWNED BY public.products_product.id;
          public          postgres    false    221            �            1259    16585    products_productrates    TABLE     N  CREATE TABLE public.products_productrates (
    id bigint NOT NULL,
    "Description" character varying(255) NOT NULL,
    "Product_id" bigint NOT NULL,
    "Cover" numeric(8,2),
    "Rate" numeric(8,2),
    "AgeFrom" integer,
    "AgeTo" integer,
    "DateAdded" timestamp with time zone NOT NULL,
    "isActive" boolean NOT NULL
);
 )   DROP TABLE public.products_productrates;
       public         heap    postgres    false            �            1259    16583    products_productrates_id_seq    SEQUENCE     �   CREATE SEQUENCE public.products_productrates_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 3   DROP SEQUENCE public.products_productrates_id_seq;
       public          postgres    false    224            �           0    0    products_productrates_id_seq    SEQUENCE OWNED BY     ]   ALTER SEQUENCE public.products_productrates_id_seq OWNED BY public.products_productrates.id;
          public          postgres    false    223            �           2604    33365    accounts_paymentledger id    DEFAULT     �   ALTER TABLE ONLY public.accounts_paymentledger ALTER COLUMN id SET DEFAULT nextval('public.accounts_paymentledger_id_seq'::regclass);
 H   ALTER TABLE public.accounts_paymentledger ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    235    236    236            �           2604    33357    accounts_receipt id    DEFAULT     z   ALTER TABLE ONLY public.accounts_receipt ALTER COLUMN id SET DEFAULT nextval('public.accounts_receipt_id_seq'::regclass);
 B   ALTER TABLE public.accounts_receipt ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    234    233    234            �           2604    16430    auth_group id    DEFAULT     n   ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);
 <   ALTER TABLE public.auth_group ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    207    206    207            �           2604    16440    auth_group_permissions id    DEFAULT     �   ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);
 H   ALTER TABLE public.auth_group_permissions ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    209    208    209            �           2604    16422    auth_permission id    DEFAULT     x   ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);
 A   ALTER TABLE public.auth_permission ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    205    204    205            �           2604    16448    auth_user id    DEFAULT     l   ALTER TABLE ONLY public.auth_user ALTER COLUMN id SET DEFAULT nextval('public.auth_user_id_seq'::regclass);
 ;   ALTER TABLE public.auth_user ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    211    210    211            �           2604    16458    auth_user_groups id    DEFAULT     z   ALTER TABLE ONLY public.auth_user_groups ALTER COLUMN id SET DEFAULT nextval('public.auth_user_groups_id_seq'::regclass);
 B   ALTER TABLE public.auth_user_groups ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    212    213    213            �           2604    16466    auth_user_user_permissions id    DEFAULT     �   ALTER TABLE ONLY public.auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_user_user_permissions_id_seq'::regclass);
 L   ALTER TABLE public.auth_user_user_permissions ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    214    215    215            �           2604    16559    clients_client id    DEFAULT     v   ALTER TABLE ONLY public.clients_client ALTER COLUMN id SET DEFAULT nextval('public.clients_client_id_seq'::regclass);
 @   ALTER TABLE public.clients_client ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    219    218    219            �           2604    16526    django_admin_log id    DEFAULT     z   ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);
 B   ALTER TABLE public.django_admin_log ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    217    216    217            �           2604    16412    django_content_type id    DEFAULT     �   ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);
 E   ALTER TABLE public.django_content_type ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    202    203    203            �           2604    16401    django_migrations id    DEFAULT     |   ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);
 C   ALTER TABLE public.django_migrations ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    200    201    201            �           2604    16917    policy_policy id    DEFAULT     t   ALTER TABLE ONLY public.policy_policy ALTER COLUMN id SET DEFAULT nextval('public.policy_policy_id_seq'::regclass);
 ?   ALTER TABLE public.policy_policy ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    225    226    226            �           2604    16947    policy_policyledger id    DEFAULT     �   ALTER TABLE ONLY public.policy_policyledger ALTER COLUMN id SET DEFAULT nextval('public.policy_policyledger_id_seq'::regclass);
 E   ALTER TABLE public.policy_policyledger ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    232    231    232            �           2604    16936    policy_policymembers id    DEFAULT     �   ALTER TABLE ONLY public.policy_policymembers ALTER COLUMN id SET DEFAULT nextval('public.policy_policymembers_id_seq'::regclass);
 F   ALTER TABLE public.policy_policymembers ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    230    229    230            �           2604    16925    policy_policyversion id    DEFAULT     �   ALTER TABLE ONLY public.policy_policyversion ALTER COLUMN id SET DEFAULT nextval('public.policy_policyversion_id_seq'::regclass);
 F   ALTER TABLE public.policy_policyversion ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    228    227    228            �           2604    16580    products_product id    DEFAULT     z   ALTER TABLE ONLY public.products_product ALTER COLUMN id SET DEFAULT nextval('public.products_product_id_seq'::regclass);
 B   ALTER TABLE public.products_product ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    222    221    222            �           2604    16588    products_productrates id    DEFAULT     �   ALTER TABLE ONLY public.products_productrates ALTER COLUMN id SET DEFAULT nextval('public.products_productrates_id_seq'::regclass);
 G   ALTER TABLE public.products_productrates ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    223    224    224            �          0    33362    accounts_paymentledger 
   TABLE DATA           _   COPY public.accounts_paymentledger (id, "PolicyLedger_id", "Receipt_id", "Amount") FROM stdin;
    public          postgres    false    236   S      �          0    33354    accounts_receipt 
   TABLE DATA           ^   COPY public.accounts_receipt (id, "Amount", "Date", "PaymentMethod", "Client_id") FROM stdin;
    public          postgres    false    234   �      �          0    16427 
   auth_group 
   TABLE DATA           .   COPY public.auth_group (id, name) FROM stdin;
    public          postgres    false    207   �      �          0    16437    auth_group_permissions 
   TABLE DATA           M   COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
    public          postgres    false    209   �      �          0    16419    auth_permission 
   TABLE DATA           N   COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
    public          postgres    false    205   �      �          0    16445 	   auth_user 
   TABLE DATA           �   COPY public.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
    public          postgres    false    211   D      �          0    16455    auth_user_groups 
   TABLE DATA           A   COPY public.auth_user_groups (id, user_id, group_id) FROM stdin;
    public          postgres    false    213   i      �          0    16463    auth_user_user_permissions 
   TABLE DATA           P   COPY public.auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
    public          postgres    false    215   �      �          0    16556    clients_client 
   TABLE DATA           �   COPY public.clients_client (id, "First_Name", "Last_Name", "Cell_Number", "Email", "Gender", "ID_Number", "ID_Type", "Telephone", "Title", "DateAdded", "DateOfBirth", "CreatedBy_id", "DateUpdated", "IsDeleted", "UpdatedBy_id") FROM stdin;
    public          postgres    false    219   �      �          0    16523    django_admin_log 
   TABLE DATA           �   COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
    public          postgres    false    217   �      �          0    16409    django_content_type 
   TABLE DATA           C   COPY public.django_content_type (id, app_label, model) FROM stdin;
    public          postgres    false    203   }      �          0    16398    django_migrations 
   TABLE DATA           C   COPY public.django_migrations (id, app, name, applied) FROM stdin;
    public          postgres    false    201   3      �          0    16565    django_session 
   TABLE DATA           P   COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
    public          postgres    false    220   �      �          0    16914    policy_policy 
   TABLE DATA              COPY public.policy_policy (id, "Number", "InceptionDate", "CollectionDay", "DateAdded", "Client_id", "Product_id") FROM stdin;
    public          postgres    false    226   �       �          0    16944    policy_policyledger 
   TABLE DATA           t   COPY public.policy_policyledger (id, "Amount", "TransactionDate", "CollectionDate", "PolicyVersion_id") FROM stdin;
    public          postgres    false    232   �&      �          0    16933    policy_policymembers 
   TABLE DATA           �   COPY public.policy_policymembers (id, "MemberType", "First_Name", "Last_Name", "Gender", "DateOfBirth", "ID_Type", "ID_Number", "Title", "Student", "DateAdded", "PolicyVersion_id", "Premium", "Cover", "CoverAmount") FROM stdin;
    public          postgres    false    230   �(      �          0    16922    policy_policyversion 
   TABLE DATA             COPY public.policy_policyversion (id, "EndorsementType", "EndorsementReason", "EffectiveDateFrom", "EffectiveDateTo", "Description", "Cover", "DateAdded", "Policy_id", "IsLatest", "Status", "Version_Number", "CoverAmount", "ApprovedBy_id", "CreatedBy_id", "DeclinedBy_id") FROM stdin;
    public          postgres    false    228   �3      �          0    16577    products_product 
   TABLE DATA           W   COPY public.products_product (id, "Name", "Code", "DateAdded", "isActive") FROM stdin;
    public          postgres    false    222   >      �          0    16585    products_productrates 
   TABLE DATA           �   COPY public.products_productrates (id, "Description", "Product_id", "Cover", "Rate", "AgeFrom", "AgeTo", "DateAdded", "isActive") FROM stdin;
    public          postgres    false    224   �>      �           0    0    accounts_paymentledger_id_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public.accounts_paymentledger_id_seq', 69, true);
          public          postgres    false    235            �           0    0    accounts_receipt_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.accounts_receipt_id_seq', 39, true);
          public          postgres    false    233            �           0    0    auth_group_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.auth_group_id_seq', 6, true);
          public          postgres    false    206            �           0    0    auth_group_permissions_id_seq    SEQUENCE SET     K   SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, true);
          public          postgres    false    208            �           0    0    auth_permission_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.auth_permission_id_seq', 60, true);
          public          postgres    false    204            �           0    0    auth_user_groups_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.auth_user_groups_id_seq', 1, false);
          public          postgres    false    212            �           0    0    auth_user_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.auth_user_id_seq', 2, true);
          public          postgres    false    210            �           0    0 !   auth_user_user_permissions_id_seq    SEQUENCE SET     P   SELECT pg_catalog.setval('public.auth_user_user_permissions_id_seq', 1, false);
          public          postgres    false    214            �           0    0    clients_client_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.clients_client_id_seq', 20, true);
          public          postgres    false    218            �           0    0    django_admin_log_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.django_admin_log_id_seq', 39, true);
          public          postgres    false    216            �           0    0    django_content_type_id_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.django_content_type_id_seq', 15, true);
          public          postgres    false    202            �           0    0    django_migrations_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.django_migrations_id_seq', 48, true);
          public          postgres    false    200            �           0    0    policy_policy_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.policy_policy_id_seq', 94, true);
          public          postgres    false    225            �           0    0    policy_policyledger_id_seq    SEQUENCE SET     J   SELECT pg_catalog.setval('public.policy_policyledger_id_seq', 104, true);
          public          postgres    false    231            �           0    0    policy_policymembers_id_seq    SEQUENCE SET     K   SELECT pg_catalog.setval('public.policy_policymembers_id_seq', 109, true);
          public          postgres    false    229            �           0    0    policy_policyversion_id_seq    SEQUENCE SET     K   SELECT pg_catalog.setval('public.policy_policyversion_id_seq', 118, true);
          public          postgres    false    227            �           0    0    products_product_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.products_product_id_seq', 5, true);
          public          postgres    false    221            �           0    0    products_productrates_id_seq    SEQUENCE SET     K   SELECT pg_catalog.setval('public.products_productrates_id_seq', 15, true);
          public          postgres    false    223                        2606    33367 2   accounts_paymentledger accounts_paymentledger_pkey 
   CONSTRAINT     p   ALTER TABLE ONLY public.accounts_paymentledger
    ADD CONSTRAINT accounts_paymentledger_pkey PRIMARY KEY (id);
 \   ALTER TABLE ONLY public.accounts_paymentledger DROP CONSTRAINT accounts_paymentledger_pkey;
       public            postgres    false    236            �           2606    33359 &   accounts_receipt accounts_receipt_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.accounts_receipt
    ADD CONSTRAINT accounts_receipt_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.accounts_receipt DROP CONSTRAINT accounts_receipt_pkey;
       public            postgres    false    234            �           2606    16552    auth_group auth_group_name_key 
   CONSTRAINT     Y   ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);
 H   ALTER TABLE ONLY public.auth_group DROP CONSTRAINT auth_group_name_key;
       public            postgres    false    207            �           2606    16479 R   auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);
 |   ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq;
       public            postgres    false    209    209            �           2606    16442 2   auth_group_permissions auth_group_permissions_pkey 
   CONSTRAINT     p   ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);
 \   ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissions_pkey;
       public            postgres    false    209            �           2606    16432    auth_group auth_group_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.auth_group DROP CONSTRAINT auth_group_pkey;
       public            postgres    false    207            �           2606    16470 F   auth_permission auth_permission_content_type_id_codename_01ab375a_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);
 p   ALTER TABLE ONLY public.auth_permission DROP CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq;
       public            postgres    false    205    205            �           2606    16424 $   auth_permission auth_permission_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);
 N   ALTER TABLE ONLY public.auth_permission DROP CONSTRAINT auth_permission_pkey;
       public            postgres    false    205            �           2606    16460 &   auth_user_groups auth_user_groups_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.auth_user_groups DROP CONSTRAINT auth_user_groups_pkey;
       public            postgres    false    213            �           2606    16494 @   auth_user_groups auth_user_groups_user_id_group_id_94350c0c_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq UNIQUE (user_id, group_id);
 j   ALTER TABLE ONLY public.auth_user_groups DROP CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq;
       public            postgres    false    213    213            �           2606    16450    auth_user auth_user_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.auth_user DROP CONSTRAINT auth_user_pkey;
       public            postgres    false    211            �           2606    16468 :   auth_user_user_permissions auth_user_user_permissions_pkey 
   CONSTRAINT     x   ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);
 d   ALTER TABLE ONLY public.auth_user_user_permissions DROP CONSTRAINT auth_user_user_permissions_pkey;
       public            postgres    false    215            �           2606    16508 Y   auth_user_user_permissions auth_user_user_permissions_user_id_permission_id_14a6b632_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq UNIQUE (user_id, permission_id);
 �   ALTER TABLE ONLY public.auth_user_user_permissions DROP CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq;
       public            postgres    false    215    215            �           2606    16546     auth_user auth_user_username_key 
   CONSTRAINT     _   ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);
 J   ALTER TABLE ONLY public.auth_user DROP CONSTRAINT auth_user_username_key;
       public            postgres    false    211            �           2606    41546 5   clients_client clients_client_ID_Number_366b1efc_uniq 
   CONSTRAINT     y   ALTER TABLE ONLY public.clients_client
    ADD CONSTRAINT "clients_client_ID_Number_366b1efc_uniq" UNIQUE ("ID_Number");
 a   ALTER TABLE ONLY public.clients_client DROP CONSTRAINT "clients_client_ID_Number_366b1efc_uniq";
       public            postgres    false    219            �           2606    16564 "   clients_client clients_client_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.clients_client
    ADD CONSTRAINT clients_client_pkey PRIMARY KEY (id);
 L   ALTER TABLE ONLY public.clients_client DROP CONSTRAINT clients_client_pkey;
       public            postgres    false    219            �           2606    16532 &   django_admin_log django_admin_log_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.django_admin_log DROP CONSTRAINT django_admin_log_pkey;
       public            postgres    false    217            �           2606    16416 E   django_content_type django_content_type_app_label_model_76bd3d3b_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);
 o   ALTER TABLE ONLY public.django_content_type DROP CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq;
       public            postgres    false    203    203            �           2606    16414 ,   django_content_type django_content_type_pkey 
   CONSTRAINT     j   ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);
 V   ALTER TABLE ONLY public.django_content_type DROP CONSTRAINT django_content_type_pkey;
       public            postgres    false    203            �           2606    16406 (   django_migrations django_migrations_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);
 R   ALTER TABLE ONLY public.django_migrations DROP CONSTRAINT django_migrations_pkey;
       public            postgres    false    201            �           2606    16572 "   django_session django_session_pkey 
   CONSTRAINT     i   ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);
 L   ALTER TABLE ONLY public.django_session DROP CONSTRAINT django_session_pkey;
       public            postgres    false    220            �           2606    16919     policy_policy policy_policy_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.policy_policy
    ADD CONSTRAINT policy_policy_pkey PRIMARY KEY (id);
 J   ALTER TABLE ONLY public.policy_policy DROP CONSTRAINT policy_policy_pkey;
       public            postgres    false    226            �           2606    16949 ,   policy_policyledger policy_policyledger_pkey 
   CONSTRAINT     j   ALTER TABLE ONLY public.policy_policyledger
    ADD CONSTRAINT policy_policyledger_pkey PRIMARY KEY (id);
 V   ALTER TABLE ONLY public.policy_policyledger DROP CONSTRAINT policy_policyledger_pkey;
       public            postgres    false    232            �           2606    16941 .   policy_policymembers policy_policymembers_pkey 
   CONSTRAINT     l   ALTER TABLE ONLY public.policy_policymembers
    ADD CONSTRAINT policy_policymembers_pkey PRIMARY KEY (id);
 X   ALTER TABLE ONLY public.policy_policymembers DROP CONSTRAINT policy_policymembers_pkey;
       public            postgres    false    230            �           2606    16930 .   policy_policyversion policy_policyversion_pkey 
   CONSTRAINT     l   ALTER TABLE ONLY public.policy_policyversion
    ADD CONSTRAINT policy_policyversion_pkey PRIMARY KEY (id);
 X   ALTER TABLE ONLY public.policy_policyversion DROP CONSTRAINT policy_policyversion_pkey;
       public            postgres    false    228            �           2606    16582 &   products_product products_product_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.products_product
    ADD CONSTRAINT products_product_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.products_product DROP CONSTRAINT products_product_pkey;
       public            postgres    false    222            �           2606    16590 0   products_productrates products_productrates_pkey 
   CONSTRAINT     n   ALTER TABLE ONLY public.products_productrates
    ADD CONSTRAINT products_productrates_pkey PRIMARY KEY (id);
 Z   ALTER TABLE ONLY public.products_productrates DROP CONSTRAINT products_productrates_pkey;
       public            postgres    false    224            �           1259    33384 /   accounts_paymentledger_PolicyLedger_id_5018897f    INDEX     �   CREATE INDEX "accounts_paymentledger_PolicyLedger_id_5018897f" ON public.accounts_paymentledger USING btree ("PolicyLedger_id");
 E   DROP INDEX public."accounts_paymentledger_PolicyLedger_id_5018897f";
       public            postgres    false    236            �           1259    33385 *   accounts_paymentledger_Receipt_id_e63212c0    INDEX     w   CREATE INDEX "accounts_paymentledger_Receipt_id_e63212c0" ON public.accounts_paymentledger USING btree ("Receipt_id");
 @   DROP INDEX public."accounts_paymentledger_Receipt_id_e63212c0";
       public            postgres    false    236            �           1259    33373 #   accounts_receipt_Client_id_5db34490    INDEX     i   CREATE INDEX "accounts_receipt_Client_id_5db34490" ON public.accounts_receipt USING btree ("Client_id");
 9   DROP INDEX public."accounts_receipt_Client_id_5db34490";
       public            postgres    false    234            �           1259    16553    auth_group_name_a6ea08ec_like    INDEX     h   CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);
 1   DROP INDEX public.auth_group_name_a6ea08ec_like;
       public            postgres    false    207            �           1259    16490 (   auth_group_permissions_group_id_b120cbf9    INDEX     o   CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);
 <   DROP INDEX public.auth_group_permissions_group_id_b120cbf9;
       public            postgres    false    209            �           1259    16491 -   auth_group_permissions_permission_id_84c5c92e    INDEX     y   CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);
 A   DROP INDEX public.auth_group_permissions_permission_id_84c5c92e;
       public            postgres    false    209            �           1259    16476 (   auth_permission_content_type_id_2f476e4b    INDEX     o   CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);
 <   DROP INDEX public.auth_permission_content_type_id_2f476e4b;
       public            postgres    false    205            �           1259    16506 "   auth_user_groups_group_id_97559544    INDEX     c   CREATE INDEX auth_user_groups_group_id_97559544 ON public.auth_user_groups USING btree (group_id);
 6   DROP INDEX public.auth_user_groups_group_id_97559544;
       public            postgres    false    213            �           1259    16505 !   auth_user_groups_user_id_6a12ed8b    INDEX     a   CREATE INDEX auth_user_groups_user_id_6a12ed8b ON public.auth_user_groups USING btree (user_id);
 5   DROP INDEX public.auth_user_groups_user_id_6a12ed8b;
       public            postgres    false    213            �           1259    16520 1   auth_user_user_permissions_permission_id_1fbb5f2c    INDEX     �   CREATE INDEX auth_user_user_permissions_permission_id_1fbb5f2c ON public.auth_user_user_permissions USING btree (permission_id);
 E   DROP INDEX public.auth_user_user_permissions_permission_id_1fbb5f2c;
       public            postgres    false    215            �           1259    16519 +   auth_user_user_permissions_user_id_a95ead1b    INDEX     u   CREATE INDEX auth_user_user_permissions_user_id_a95ead1b ON public.auth_user_user_permissions USING btree (user_id);
 ?   DROP INDEX public.auth_user_user_permissions_user_id_a95ead1b;
       public            postgres    false    215            �           1259    16547     auth_user_username_6821ab7c_like    INDEX     n   CREATE INDEX auth_user_username_6821ab7c_like ON public.auth_user USING btree (username varchar_pattern_ops);
 4   DROP INDEX public.auth_user_username_6821ab7c_like;
       public            postgres    false    211            �           1259    41537 $   clients_client_CreatedBy_id_b744c4b2    INDEX     k   CREATE INDEX "clients_client_CreatedBy_id_b744c4b2" ON public.clients_client USING btree ("CreatedBy_id");
 :   DROP INDEX public."clients_client_CreatedBy_id_b744c4b2";
       public            postgres    false    219            �           1259    41547 &   clients_client_ID_Number_366b1efc_like    INDEX     ~   CREATE INDEX "clients_client_ID_Number_366b1efc_like" ON public.clients_client USING btree ("ID_Number" varchar_pattern_ops);
 <   DROP INDEX public."clients_client_ID_Number_366b1efc_like";
       public            postgres    false    219            �           1259    41538 $   clients_client_UpdatedBy_id_3e091c53    INDEX     k   CREATE INDEX "clients_client_UpdatedBy_id_3e091c53" ON public.clients_client USING btree ("UpdatedBy_id");
 :   DROP INDEX public."clients_client_UpdatedBy_id_3e091c53";
       public            postgres    false    219            �           1259    16543 )   django_admin_log_content_type_id_c4bce8eb    INDEX     q   CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);
 =   DROP INDEX public.django_admin_log_content_type_id_c4bce8eb;
       public            postgres    false    217            �           1259    16544 !   django_admin_log_user_id_c564eba6    INDEX     a   CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);
 5   DROP INDEX public.django_admin_log_user_id_c564eba6;
       public            postgres    false    217            �           1259    16574 #   django_session_expire_date_a5c62663    INDEX     e   CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);
 7   DROP INDEX public.django_session_expire_date_a5c62663;
       public            postgres    false    220            �           1259    16573 (   django_session_session_key_c0390e0f_like    INDEX     ~   CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);
 <   DROP INDEX public.django_session_session_key_c0390e0f_like;
       public            postgres    false    220            �           1259    16960     policy_policy_Client_id_e83a27ff    INDEX     c   CREATE INDEX "policy_policy_Client_id_e83a27ff" ON public.policy_policy USING btree ("Client_id");
 6   DROP INDEX public."policy_policy_Client_id_e83a27ff";
       public            postgres    false    226            �           1259    16961 !   policy_policy_Product_id_dface76a    INDEX     e   CREATE INDEX "policy_policy_Product_id_dface76a" ON public.policy_policy USING btree ("Product_id");
 7   DROP INDEX public."policy_policy_Product_id_dface76a";
       public            postgres    false    226            �           1259    16979 -   policy_policyledger_PolicyVersion_id_24e83221    INDEX     }   CREATE INDEX "policy_policyledger_PolicyVersion_id_24e83221" ON public.policy_policyledger USING btree ("PolicyVersion_id");
 C   DROP INDEX public."policy_policyledger_PolicyVersion_id_24e83221";
       public            postgres    false    232            �           1259    16973 .   policy_policymembers_PolicyVersion_id_d8e1073c    INDEX        CREATE INDEX "policy_policymembers_PolicyVersion_id_d8e1073c" ON public.policy_policymembers USING btree ("PolicyVersion_id");
 D   DROP INDEX public."policy_policymembers_PolicyVersion_id_d8e1073c";
       public            postgres    false    230            �           1259    33349 +   policy_policyversion_ApprovedBy_id_50420904    INDEX     y   CREATE INDEX "policy_policyversion_ApprovedBy_id_50420904" ON public.policy_policyversion USING btree ("ApprovedBy_id");
 A   DROP INDEX public."policy_policyversion_ApprovedBy_id_50420904";
       public            postgres    false    228            �           1259    33350 *   policy_policyversion_CreatedBy_id_aee029b7    INDEX     w   CREATE INDEX "policy_policyversion_CreatedBy_id_aee029b7" ON public.policy_policyversion USING btree ("CreatedBy_id");
 @   DROP INDEX public."policy_policyversion_CreatedBy_id_aee029b7";
       public            postgres    false    228            �           1259    33351 +   policy_policyversion_DeclinedBy_id_cbf789cf    INDEX     y   CREATE INDEX "policy_policyversion_DeclinedBy_id_cbf789cf" ON public.policy_policyversion USING btree ("DeclinedBy_id");
 A   DROP INDEX public."policy_policyversion_DeclinedBy_id_cbf789cf";
       public            postgres    false    228            �           1259    16967 '   policy_policyversion_Policy_id_386ae139    INDEX     q   CREATE INDEX "policy_policyversion_Policy_id_386ae139" ON public.policy_policyversion USING btree ("Policy_id");
 =   DROP INDEX public."policy_policyversion_Policy_id_386ae139";
       public            postgres    false    228            �           1259    16596 )   products_productrates_Product_id_d86d66ed    INDEX     u   CREATE INDEX "products_productrates_Product_id_d86d66ed" ON public.products_productrates USING btree ("Product_id");
 ?   DROP INDEX public."products_productrates_Product_id_d86d66ed";
       public            postgres    false    224                       2606    33374 Q   accounts_paymentledger accounts_paymentledg_PolicyLedger_id_5018897f_fk_policy_po    FK CONSTRAINT     �   ALTER TABLE ONLY public.accounts_paymentledger
    ADD CONSTRAINT "accounts_paymentledg_PolicyLedger_id_5018897f_fk_policy_po" FOREIGN KEY ("PolicyLedger_id") REFERENCES public.policy_policyledger(id) DEFERRABLE INITIALLY DEFERRED;
 }   ALTER TABLE ONLY public.accounts_paymentledger DROP CONSTRAINT "accounts_paymentledg_PolicyLedger_id_5018897f_fk_policy_po";
       public          postgres    false    236    232    3321                       2606    33379 L   accounts_paymentledger accounts_paymentledg_Receipt_id_e63212c0_fk_accounts_    FK CONSTRAINT     �   ALTER TABLE ONLY public.accounts_paymentledger
    ADD CONSTRAINT "accounts_paymentledg_Receipt_id_e63212c0_fk_accounts_" FOREIGN KEY ("Receipt_id") REFERENCES public.accounts_receipt(id) DEFERRABLE INITIALLY DEFERRED;
 x   ALTER TABLE ONLY public.accounts_paymentledger DROP CONSTRAINT "accounts_paymentledg_Receipt_id_e63212c0_fk_accounts_";
       public          postgres    false    3324    236    234                       2606    33368 I   accounts_receipt accounts_receipt_Client_id_5db34490_fk_clients_client_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.accounts_receipt
    ADD CONSTRAINT "accounts_receipt_Client_id_5db34490_fk_clients_client_id" FOREIGN KEY ("Client_id") REFERENCES public.clients_client(id) DEFERRABLE INITIALLY DEFERRED;
 u   ALTER TABLE ONLY public.accounts_receipt DROP CONSTRAINT "accounts_receipt_Client_id_5db34490_fk_clients_client_id";
       public          postgres    false    3296    219    234                       2606    16485 O   auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;
 y   ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm;
       public          postgres    false    205    3257    209                       2606    16480 P   auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;
 z   ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id;
       public          postgres    false    209    207    3262                       2606    16471 E   auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;
 o   ALTER TABLE ONLY public.auth_permission DROP CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co;
       public          postgres    false    205    203    3252                       2606    16500 D   auth_user_groups auth_user_groups_group_id_97559544_fk_auth_group_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;
 n   ALTER TABLE ONLY public.auth_user_groups DROP CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id;
       public          postgres    false    213    3262    207                       2606    16495 B   auth_user_groups auth_user_groups_user_id_6a12ed8b_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 l   ALTER TABLE ONLY public.auth_user_groups DROP CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id;
       public          postgres    false    3270    211    213                       2606    16514 S   auth_user_user_permissions auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;
 }   ALTER TABLE ONLY public.auth_user_user_permissions DROP CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm;
       public          postgres    false    3257    205    215                       2606    16509 V   auth_user_user_permissions auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY public.auth_user_user_permissions DROP CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id;
       public          postgres    false    211    215    3270            
           2606    41525 C   clients_client clients_client_CreatedBy_id_b744c4b2_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.clients_client
    ADD CONSTRAINT "clients_client_CreatedBy_id_b744c4b2_fk_auth_user_id" FOREIGN KEY ("CreatedBy_id") REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 o   ALTER TABLE ONLY public.clients_client DROP CONSTRAINT "clients_client_CreatedBy_id_b744c4b2_fk_auth_user_id";
       public          postgres    false    211    219    3270                       2606    41532 C   clients_client clients_client_UpdatedBy_id_3e091c53_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.clients_client
    ADD CONSTRAINT "clients_client_UpdatedBy_id_3e091c53_fk_auth_user_id" FOREIGN KEY ("UpdatedBy_id") REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 o   ALTER TABLE ONLY public.clients_client DROP CONSTRAINT "clients_client_UpdatedBy_id_3e091c53_fk_auth_user_id";
       public          postgres    false    219    211    3270                       2606    16533 G   django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co    FK CONSTRAINT     �   ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;
 q   ALTER TABLE ONLY public.django_admin_log DROP CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co;
       public          postgres    false    217    3252    203            	           2606    16538 B   django_admin_log django_admin_log_user_id_c564eba6_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 l   ALTER TABLE ONLY public.django_admin_log DROP CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id;
       public          postgres    false    211    217    3270                       2606    16950 C   policy_policy policy_policy_Client_id_e83a27ff_fk_clients_client_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.policy_policy
    ADD CONSTRAINT "policy_policy_Client_id_e83a27ff_fk_clients_client_id" FOREIGN KEY ("Client_id") REFERENCES public.clients_client(id) DEFERRABLE INITIALLY DEFERRED;
 o   ALTER TABLE ONLY public.policy_policy DROP CONSTRAINT "policy_policy_Client_id_e83a27ff_fk_clients_client_id";
       public          postgres    false    226    3296    219                       2606    16955 F   policy_policy policy_policy_Product_id_dface76a_fk_products_product_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.policy_policy
    ADD CONSTRAINT "policy_policy_Product_id_dface76a_fk_products_product_id" FOREIGN KEY ("Product_id") REFERENCES public.products_product(id) DEFERRABLE INITIALLY DEFERRED;
 r   ALTER TABLE ONLY public.policy_policy DROP CONSTRAINT "policy_policy_Product_id_dface76a_fk_products_product_id";
       public          postgres    false    226    3302    222                       2606    16974 N   policy_policyledger policy_policyledger_PolicyVersion_id_24e83221_fk_policy_po    FK CONSTRAINT     �   ALTER TABLE ONLY public.policy_policyledger
    ADD CONSTRAINT "policy_policyledger_PolicyVersion_id_24e83221_fk_policy_po" FOREIGN KEY ("PolicyVersion_id") REFERENCES public.policy_policyversion(id) DEFERRABLE INITIALLY DEFERRED;
 z   ALTER TABLE ONLY public.policy_policyledger DROP CONSTRAINT "policy_policyledger_PolicyVersion_id_24e83221_fk_policy_po";
       public          postgres    false    232    228    3315                       2606    16968 P   policy_policymembers policy_policymembers_PolicyVersion_id_d8e1073c_fk_policy_po    FK CONSTRAINT     �   ALTER TABLE ONLY public.policy_policymembers
    ADD CONSTRAINT "policy_policymembers_PolicyVersion_id_d8e1073c_fk_policy_po" FOREIGN KEY ("PolicyVersion_id") REFERENCES public.policy_policyversion(id) DEFERRABLE INITIALLY DEFERRED;
 |   ALTER TABLE ONLY public.policy_policymembers DROP CONSTRAINT "policy_policymembers_PolicyVersion_id_d8e1073c_fk_policy_po";
       public          postgres    false    228    230    3315                       2606    33333 P   policy_policyversion policy_policyversion_ApprovedBy_id_50420904_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.policy_policyversion
    ADD CONSTRAINT "policy_policyversion_ApprovedBy_id_50420904_fk_auth_user_id" FOREIGN KEY ("ApprovedBy_id") REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 |   ALTER TABLE ONLY public.policy_policyversion DROP CONSTRAINT "policy_policyversion_ApprovedBy_id_50420904_fk_auth_user_id";
       public          postgres    false    228    211    3270                       2606    33339 O   policy_policyversion policy_policyversion_CreatedBy_id_aee029b7_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.policy_policyversion
    ADD CONSTRAINT "policy_policyversion_CreatedBy_id_aee029b7_fk_auth_user_id" FOREIGN KEY ("CreatedBy_id") REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 {   ALTER TABLE ONLY public.policy_policyversion DROP CONSTRAINT "policy_policyversion_CreatedBy_id_aee029b7_fk_auth_user_id";
       public          postgres    false    211    228    3270                       2606    33344 P   policy_policyversion policy_policyversion_DeclinedBy_id_cbf789cf_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.policy_policyversion
    ADD CONSTRAINT "policy_policyversion_DeclinedBy_id_cbf789cf_fk_auth_user_id" FOREIGN KEY ("DeclinedBy_id") REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 |   ALTER TABLE ONLY public.policy_policyversion DROP CONSTRAINT "policy_policyversion_DeclinedBy_id_cbf789cf_fk_auth_user_id";
       public          postgres    false    211    228    3270                       2606    16962 P   policy_policyversion policy_policyversion_Policy_id_386ae139_fk_policy_policy_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.policy_policyversion
    ADD CONSTRAINT "policy_policyversion_Policy_id_386ae139_fk_policy_policy_id" FOREIGN KEY ("Policy_id") REFERENCES public.policy_policy(id) DEFERRABLE INITIALLY DEFERRED;
 |   ALTER TABLE ONLY public.policy_policyversion DROP CONSTRAINT "policy_policyversion_Policy_id_386ae139_fk_policy_policy_id";
       public          postgres    false    226    228    3309                       2606    16591 K   products_productrates products_productrate_Product_id_d86d66ed_fk_products_    FK CONSTRAINT     �   ALTER TABLE ONLY public.products_productrates
    ADD CONSTRAINT "products_productrate_Product_id_d86d66ed_fk_products_" FOREIGN KEY ("Product_id") REFERENCES public.products_product(id) DEFERRABLE INITIALLY DEFERRED;
 w   ALTER TABLE ONLY public.products_productrates DROP CONSTRAINT "products_productrate_Product_id_d86d66ed_fk_products_";
       public          postgres    false    224    3302    222            �   X  x�M�Q�,!C�3��%��{y�_���T�GN��!��b���~J�SwW8�����'��Ǩ�p��v��*=�JZP�O
d@��Bf�1�i�t.�a�ҹ�yӼp����O�%j�$o��7�2�V�C���Hh�7�N�𡁆h�pC��t\�Xߑ��s���K o"��8q��qJ����bo�n�b���Ļ�o���/��޺cxG����
X�Cvn�@���\��)�^[��!�����l����ZA�I�ӈ����\�Q�͂�!����,�J<����O�1т�}�� ^�
�%�,�˭���IY���r�[���Eo�Q'���=����~��2���      �   �   x�}�=�!��w����:�H�n�����&��Qz�m��7�bbz������S*��i�2�Z*�D#�YF\I���ڀ
	�@��B�h]z���a���֍���������RN��#�r2N�)8UNs#�,767��cz����`c.�BQ�|�i�2����������D2�4��Ƃ��	�+�9E?u�m���N��?�T�<      �      x�3�t�I-������ �      �      x�3�4�4������ !�      �   Y  x�m�Q��0E��U�����~�6F� � т��Qw?!q;ᯘs���n��ս�n�i~T浯!�}�c��#���v��a�/%P9p0��9�K	l�3�;
	��l1�sܶq~�ک��T��hG�+�c,
���	w���u~/B9A��ʅ�腈�NAD� g��U4xof�8>�l��������#��{�Mg�kw�y�'��k��Z�#�3��Qy�"�B��S��G?�ח���N��2Zo����'�ټ'=#Ʀ=a�12�	rVI��O��W��j6�׆����B�uD�!��yY�������f7�v��J��p�xX>�`��'�
������h�ۋ;�՜([�˂�'�ㆠ�B�BTTڐe���S=��۬��?��U���I��<�v�kj��ȼ�[>�YJ�	��O:!	�I��NH�uCM�	��Nb@�Lfx؟6Y�F|����ĳ6B�z�E��&B�V�����߳�TD���>fZ���A׹��'�i�Vӛqم��A����P(rl��J�#�G('�y��b�����=a�T��+��x�o^
7�B-ݼ"�/�~�`J>      �     x�u��N�@���)XtG����)��(���B�11���W����bЅ���InNN> u��/�{Հ�AOgNg�T1��z��]!�V����滣���t4	�f\�EV��O�����2V]��,�=�JE�-��O��I�d�<T��;�ۍ�����X�IU�z��X��(S�&����n�&��Y�������Y]�wzq�Mj�����ж�e�y�_J~_�����;�q���H!�v�ے���h� R�F�e_�'�0�O��f�      �      x������ � �      �      x������ � �      �   �  x���Mo�@���_�;�jfv��!H��R/��ƪ��|P�_�lb�:I�R�v�y��;^�&��Z�/�mQ
�	�DV�殘?,^�J�s1Seԇ��&KE@8�8F$�d�fg|t�����)Du}��E��A���h�)��_Rr!�\U��.녚�T�����{��pb��0�A
�ӁHVM��������^����d��C�b�ł�Ӯ��i�b8&�L��(�vL~.�O ��%0���@'��B����-z��'� ����XJ���p���@���U9__����u���_}`�La�F�O�E`A,�����z�o)��h���k���6�ϡAl���\�{q���$1"��20��R��G<��2A;I/�P�	��S�6�m�2��T�y���������5��겑����<�ul�0�@<�_^jA�σ{ʿ�DN�(Ҷ4������⇄S},�yGåB�Ӱz��y�KAD��s��k�0 r�4 �p^��682���H4"�� �����sQ����8�M4Z)dF�2�d�<�<u�PG�a�y��X�� �	!���$�U�	!� �i�N�m7�ﯚ,���<D���1�vH�`V���㨳?���[���,fU�0��{8\�]��+�Б㞱�jCB�2S�$�k�\Ws�~��o+�H:$�{)����V�r?��.5��f�V��r������)"Nu��<Ѿ�ƽ�k}qq��_S�      �   �  x���Ko7��� trЈ�����N���ȣ�4��E%[˒��A�{��[K�D?T�,��?�ǟ#�B�(3A'Td+2�P8���j9�\����?����3����q=���_�}{?
#8��+�$��!|�zU�c{7�3O�0%��U`$ �p8zY_5�����Y.0��Wi_'hrЇu6����5�6��V���TJIK�o՟��p��ŧz��gM�O[��n�G}���˓�Gj%�������6��馞R�r�KQ)r�A�~�n�k�"^��4.����/5� ]$4z����y�����i���MW�l9�5�5��Pin)���Rf�������&~gu{K��'S�V;����q��� cj���!�3���J��R�N���^���H��z0W1)'Vy��ng�9�V�2���=E9�U�Һ��P���9!U����H�8�FL(�숄�CD�5����BĩK�����'�����Q�P@qj��;J/M�
�4��R�"��=J.�YJ7�ւ�&�$����xx�Q`>�Ď�g�ߝ�'�`+�[ �"ۊ7��-�_b�=�e�Je!�-\�=��1��Ͳ=�׮ղ���X�͆�$��3��{Z�6Ӈs2X)/� >Y�-?�Uj޴��\.�#�I�2X�͏�G�������cxMc{��S�����p��oL�m@�#�M!߶T��|�]\��x9L�����]�{
�UN�ܓ$K��t�ס;�_P�}��+�`M� ~�*�I�ޚ�Vi��|�<�dC�7���fy @	�s��tK�4<T[�]}��Y�k�H{+7�o��??_��\��*�m����:�6-����^o�~,�`h?^�c����^׳�>|xPe�	��Ŀ7��]E�Ȋ��Շ�jK��1\���Cgޚ������o��,nBx��QH�!-���8��=Ҕf��=�sJۿ�ZSQ�p>��u��&�=�Տ�˓���j��      �   �   x�e�K�0D��a)��]ؔ�*�� ���4*V�<k4c�\�&��g�`���88�"V2q����B�=���ʜI~�@��ςg���]��dNc�J��C!��G�����s�XИ-*\�L���I����w�Mui�d�e��,K��v���/j*      �   J  x����n�L��W�����=���FlB�H���w��!!CJնR���'��c��y����q�ǝR
Bsn��jw�^�"�Kr���h���R����:��^a��㨠]u��$u��C۟���#u׿�A>����0Ĝ>�z0D�������V�p��7q`�e��T��dޫ�]�J8W]��r�QD��?U;�C��C׌c,)�CW�m}>�m�P�aD�[PtC]Gy���i��k����)�%��_�m{�f��父��|#�]��3w,�D��b����Ͱ��lѳ/ �	�O{+�j�c5�Ø��~]=���s��X�2��ܦ9߸��K�����яP٤	��@�P���^~�1��k�,׋XT��������0�:��K��ޚ�Gm	��M,�;�����(��w�~7ַZ����*��Nz=^_~��+M�ua,z�<C�k�yE�b4�O�W uI� ����"�>7n������]�,�p���ФOT��Y���y]"����.��J�MS�XJ�D�7Fa�%�P����'9B	�P�93�«�s ~o@"<o!4yk�
� �W�dJ�*�L���y���fX��^��(ؒ�k��=�ݥo���V D��f,Q�'s�>��qp�Q�y�ǮU	�DSH3veR�>?6G �=��5�z�,b�1A��a~�^�f2N�t�O��8V�@^ü0	3?�?���w=<H>���ϽPF2Y/^6h�\��v����f�3�}�$�渀@�J���0�����"|M_��N�K227i2�ϛ#o�Ѥ�E�s�T��;��jP��4w��4���A"�좗�'���c\a�.�	e��ş���,zRQ�&3J�󟖛���_��4(���t1�ӘaH9Ӱ�a�T�h[Orè�x�A1d��E͌,���f��*�`R�]��@<���|Gd�/��ۼ$�U<~���I󦳌�*�g�>�Q��nO-�@�s4�ݟXn�Kb��
^�b"dp�0�$b�d��7��k�璽�0FH�Ы�鞊�u[O�;��ɴ�y���<��r��c���1k[X �)a�///� 2c�      �     x����n�@  �����`�Y����b�*�Vr������]ҟ�/�����JD�2��q~˒:�����p�m�G�^����Tz}��W��+=8��׎u]޹���X݁��5�!�c��nv]k�mj��Գ�t&�-8�z,xn�������X�<���y2����a/�SXij&�Uo�;����$���^7!N�F�8益�4��|�u���B����j|��	�E����Gz� 	�L!�	�!�Q�E��8)�g��U��������39N�T�(�F�Qց��kb* ��3߼�t�N��A�4���(�Jz��D\�x*R�`YD3C���>îI�t�6&bP�Ϯ퓒��ϼ�/]�#�۲2�*�L?o��_�G���Wm�
W�E�®����w��"��W$>� 3���B֮��~&#*'#Nx��P��D�(�jk�Rs���&&�!�|�=�|�5#�=��Ŝ��2��[�?�� ��ĩ�e�dBfR��7���d2��w      �   �  x���ͮ�6F�3O1�"��Oy�(�}�U��9Jʴ���(�Q2��#����o��~k�������|o�u���S��x�@���w������������;ҦͰM��%(;�֔��T�@�ڎ�y�v�Z��@�*�ͩZ��eЅ�T�@_���F��5�`/�/A��6i�'����������lwG����ߚ>�HJ�xc�8�S���[4�4v�I�y��@Ӡ��5����Y7���M�ޓ�Sۺ)���S���{�Sw�:�S�i�{4��6�.r=��hz�؉��Q��S�i�[�	��:M�Ti����hj�]�t	�
���DИ.�t	/������.}6�xp���)�Ghgߙ6�:�S�%�����y
����;�&d C}N��3j�P�̈́�(d��=�;3���r��$h�D����g�����@���J0�^d_��'��g��'����$9-2j��$���kFu���(HM&�E�H�XY �IR��2j�D��B�E��QS��~�V��%i9[���Ij��"	�M���4�� �%���(O���CDѺ7e�v��-"���k���C�ۢ�F��I�C|���I{aT��a_4	��q9�����.�Y���\1-�#ٰ�$���/��_ζ�aa������v�"~��������؛~�Ryr�ė�t�E4�n�z�(��Gs��s��e�[�Wn�<R�a�&Y&�/I�[9Γ5�2��gR����r��#W%)�Za�Y�l�����-��Q��fJ:i������F��8��:[�e��;I_�� ��A���q���wH��q�o��G`����V
���K�;h�a�Z��Ȩ/-ZT�l�V�§ 5�U�k���">YU	C�E.|��M<������Զ$3�ŮD��H(r�� #rD�#��\:�-�K���9��"iIF}�8�a�\!-���d�-�i�I�C�8mAj�ꍌ&Y�.ɔaS��mF+-�t�P$+q��s��.��S<3:��'Y5I+�%Y�z<T�	!��n5I;t$ɶEQ�����O;EZ��#�����ȸ��H��G|��jP�j�k隲]@���l���F(vl,d��[�3^�7U�~��W`���E���`�.,#H�U��k���LL��Dc�N�ܷ&�0�jtvF&}�
d�C;�ՁV��33�[T��8�}�BK+�.���ܦ�����z�&oѨ�04�u�k�Vl�ۯ��rƁ(�1��ݞZ����������h��du8��$�q����Hy�h�'�и�m���g�.^W)Ȼ�W}r��b�<��A2e������}�p�jD9>{.�ܖ�gr��Q�/�dr_���#"-�_�d��~�������Onk/�z[�Q�#~(��8CƳ�L>���8��x�Ҳ?�K�
�Bc��m�ȬV8�q/���q{��(n�����&��m�[��� ����w:�����|�m�ʚ      �   N  x���[r�0�g��v�E�r���I	��o��Wq��%�]�E����#+��|���/-	`��%5��/��.��+T���V`$W@м�\ �K�O�HA�4�F��(Jz�wZ�N����#h���R �!�[L�1�qK*՘y�Z�<Ź����g��.$Z���v�u9����u:���/�Sl��J�i=1b�cf�%^��� d	����K�)8��D�B.�����۱�D[�Mт�K�)zc�1�B��)t��y�H	��)0Z���|Z�G!��扙hyb&z����'fB��j�3��,�@�t���B�Y\�t-��E����{�"�S-�S���xȔ�=dj�!S��h��(Z?>��YL����Yh^�B/�'�[̣L��ѠS��.8M݅����i�.Z������t$�v��m��q��q����>�	�6�		�6����/}-�1`�c�uc���~}�{�&�'Z�u�2@1����
PΫ8��*Z�i���"����7���"��n�z��Ƚ�j_ ��f�!ߗ���}�n�L�����3rnĈu����8�Z�      �   �
  x��[[�[�~>�zo=rȹ��"���Y7p�"w��d�%���˙9G:��F{v�l��-�ߐ��ǉu��z�_�l�?o�������C�i�e�[77���G�����k 4�О������5B��
�E�2+M����&膜Һ��ק�a��v�i���+,?��sz���v������S��_�!p:�����%�0D@+�[�-���&!�&�i~|��g��q�    �#0��U�����������y���~�u�������o�P�A(�8���F_�rZ��� ]���ǧ��������f�O(\J=GAn�h���6x��aP����������]������}у6�D%&��o#7�[t6d�!?���q~�PB�a<.�Z4J�W�2_�H0%� �% �!�St��T��xGi�&���%PޢS��ϕ |X�ow�.�A�n��`߲V��1�Ap�X�~IVN�Q�`�5FY罦�V��f荛����q�A�������Jn$�e�⃥.�B��O_Ϗ����n�[K������5�j�T�Rqx��hY�Yy�r�d9��_>��;n����n�n��C��$�$�㿁G�0}f;J�ߧ��,���izC��P�
K�S�D��܊�������0<��&�L۔#v�Ά�5�h%��'ɩ����a$�(��(�S���蕗��s`��(R&.��ߟ�=��SOhJ��F��S 85��i�R��p"�	��$�����&�5�I���M��/�6��s�zfg�"�#%�*�tѤ�4����f�U`�9~����Ϳ�m�j�m:�P>�=9)[�|���z�qXE`1�ЙP�!��Z&�j��C�Ǐ�۠�0��sH���y���n}/f�_�;��������3.e4�'�%�2�p�t��|\�w������?I�|�̹xV���k�;���<���e۝ٞӕ�RѬ�R

Y�O����b)���?>�?o���;!t�����?U�ϱ�*ϞtJ5;�U�HT�\!g�Y{�`O�		=z$�
�����q���ˇ�qߒUF&�L� �L��/��b_ ��ք�N(x��ɠ��V��ۍ:QD-�2�B:��t�3��9�0�9�T5T>�)�\=ե^�1�;����������7<�S]�ؓ���)�/�1�	�mJL��l�ܴM�\�&"[���b�W���gS���W��3�q`;�%�� �!�cǼ]����� ��a6Jh��������Q��Bg��MW?�Ie-u���o����_5��-]ܩ Ù�^D���ZF�,J�[W�����A�Cm��z��C1VՑ���:	����u8�W�M�����"�21�
uTk�M��*�Qe�4��l��{S>��z�e����`�NPL0j���AQ4&6��<uc�vרW�p1q|1�E��
=���]�"��r�G!Ϡp�N\��;�

���*{vG��D<��i'�086�N�%�"�|V��?�-M�W�x	��P�a������e�l�Z�J���I7��E�p�*%e
?wZ
���ڧެ[�Y�<t�U�1ntJ7�i��X�|�z&��XXj,̌Ea>D&�:�k1Cc0�57����n�;�Xu�tNЉn�?<�h�l!�����Y0�y�p��:��Lq��M�x8�bE��l*�WI���Qr�$;Э0)�@��si6�+
k��M�AwL�ٞ��$t^�Y�8�M2�Td�$N�7��O���/G���䚒Ҥ#ME)���JSAX� � GV��,EF�r`;�I*��4��o�S�Y�s�.e�����N*(�W_�� �䠄@�@p�U� �� ��rc$��:�0���4(`OEо�?l	٨��F�؝Cs$F�^Q_�p1\���U֐�������IT~?%��${�oJ2�k�"� E�Q'�1D�����-C(I�I3ԑ#!�^2�$���<ٔTZA���<t�a��M�%�k��QW�P�IӍ"t�Q>c-�����C����1&Z�.d
�0��VI;�~�|a"8-0_2!]�I�H
q���%����oij\�F�A���	�q�y��IҠO��U-�j�t���+���5�I���R0~�U?��	�Q6U2$y��]�{��M6�"�HȂ��!QZ[_l�R�����!n��{���:;�R�[�
�C`%�Ko����zE��a�"�PF>��v^����M�@�� KP(��=%���U��	ܔ�(qxVQ�:��?t�1?y����O�41�-��?��3�"-�r�(f���@�*�֒KL���d�-٤mǺ�!��)_�g�5���"OC��w0�픪(�T ��<�4�7N:���ah���3�n��A�+�JBp�A����+��W@�.��/*�E���o���@�w?�v��eҳ2 ���'��;&�Wp'��g�I�@L9�⠥s&��R�X�x�. ��x���iK=c��nb��/����aS���0���t�1;� �)����]�'շ��� `���3�KHN/ޘ�F�`	��C�YB
��Ot&��NdݴD�z	���`���:�r�����u��;
#�ح��5k��T���	�<e�;M�ʧۥ��e;eV����ڵ�^}ϭ|\��,Rx|�]�j_����.���f�l�xR�b����my�쀥5.�����00i��d6�� �U:��J��b�_�]e���Nz��B����J���޽{�?S[�      �   I
  x��[K��>�~���}3�!�$7_�ݱ��ze�6��S${��!{�w���૩�W_9��q������/�m��a�px<�^��'/ڂ0M ��bq#���^>���������q�������p-C��D	�5�h-�����A $��D��h<�7�=%�؄�up7 L�6�Op`�x��?Z7���*^��d�8X6�ق<h���x<�gw6�B/�N�	'��BL�dg<;v��Q,�Á��>�\�M,��*0�J0hs@��5���4-�	�z'�]�P#��h ���8��6Z�O棡V�:2H�Jh�	����\m�����f���|4R�#��a�K�t����{Ԕ��ߟ�bk� �t�H��mF��FJ<���[ʼ����P�-��y 4�"���;���D��#�m&l�%�&2�Y�|d�a����J���}��0e5D1-V*v���N��}�\�+<A�wC���Е,�JEO����%ŝ��of/�T�]����B�穢&�mJ�]��DO%�T��6�݂  q��n�6�݂��Q��
�M��4w8AR�B��eR��.��ݨ�p@T��|�LG��tD��q�TF��t������/��M�2|������q]_Y�DB��\!�)~�����:�g�~�*d�:E����W�n���+�2��4�HH���X�3�:�w��>i��9�y�Q����������޽~;y��<5P4:Se�嶨��]AW5uR�k�����mi�߃=�����ϯO������_ۓ4�/�������f���̦4�Ɣ0�V$��Rq�K[|8ڒ��i��3�� ����M{ʘ�q����}���Yn�hF�'4\2����;8��c���H��a�I7l�(��+ (W�Ҟ�Q&+�C[�~J��وJ���F��ov�ϔ升�|���s/�ӡ!P�8�i�j�ԞQ��"&� �R�kK�ܿdNjJ�Z�ҔB����Ŗeeҵ%m��3����(�4d�:SX�P�0�QŔe5�3�mj�>��Ŗ�ژ��P;kl��댲s9P�H��-�i��(�Pp���J���r���N��PD�[*�wj�}؞�G��t����jO�t\~�MpW�@~Y0j�1�$��D�R��Rű��vQ���T�D��@���%}f-9[�\�(i{��Ĝ-��9���=�HТU1N�e�I�;�W� @<��mM���\��������i�k�����	��e=�۳�kS��% J^���2@ƢF��U�kMM��±*�xb��	�Q�N��XUbeV�����������ﻗ����_��߾����~�����u��^�,�$���2Zt�����.cC>VV�1H��i&�9���}��H��Vz�H�E�D�_�Ԩ�c?R�V�H�����k�%�2�C����q4�"P<�-�ţ�Q��X��l�J���>���w1�w�c�ќ�����m�����ßc2_w��i9#�T	2Y,�<G��{(ǐ7�h�c,�j��Tȇ�������v��g,def1Q�0Y)����.�������O}��D:.�Knά�B>�����%Z�rɇ��衹��掮�RM��]�h?)�J�P~��09�09���?��}�M9��)��:1�l�1��B�Aʾ�+�����}�Q9������T+�\��j�o�3��<�$/�QU��@;�N�r�s��!�)m/c���"v{n໪#�DQN�)��m������1qT#H�9��[��e��
����u�Τ͕Fh�<'A��"b�q�"��A2�Aͳ)q5���X@	9<�}\TZK�.5Ӕ�+�P&��2�)}Z\#�?��02��g��*+�8��k؈w5)�hi
���&���=�p��:�ԕ�A�$^�J��DE���(�z���^�jŞ��Qj��K�;\��2%^�f�6��;i�e$9���3r�f�Y]�Q�5�(�A�\3钎�.��~Z�M����to�\<���J3���#�=l�[��4�J'�%d}��[�g�rK\:��R��}#��n�s��!� +%��0�P�%�;��̚*�Ұ�.]o�Ӿ�4fq��/�%�+Wяg��}�i4�VR~;Q��	���}�Ψ�֚�do�Q�J���[*k��:{+��J�5��p4e�[Z���n�o!;C:7�bK����a�=�Q��Ag}�^arPef0-:��LC�;�ҥ��N�`�I���w��������}���{y<������X�s$�2�PŴ�=�a1C:LAV��{ar�T�魓�%	>����F^��=�Q[��dL�Za�������饲�uM��F�PP4�<�Mb�C� ��4^����]P����̮���I_N!ね�Ѥ�J>ÜmݹY�$:,�.O+�����o�u����U��t�V�J;��A*�_����$P��9�*�U��p�I��p2���*��F%�XBe�&~if�C���30�C��R��Ic��<��{�+��1Dy�='L��+�xT.<F���Z�W��c�?���[�l�ݑ�a��|������Y�      �   �   x�m���0F�O����BEٸ��L.MZ��V�E��Kq�s��q���/��N9#�@�s�p�P�����\����� i���BGО�3ΐ�F�-����[�[m&��W��cr�W�����s���0��OA���R]��\Ix�)K"9����!�?�      �   �  x���AO�0�s�=j��׾z31&��g/S8�l�Lfⷷ]��	遄_���O�M����ۦ��%:�&� ��L�ѷ� �mX	�т�0N�J@���M�fL�޴�ĕ�=�y�F�rJ9�GSϘ6�����e�]��F�g�,�p���6!Y��Fֈ纨~�b�Z�F@}�8�f�]��vu�.�y]�	�Q�:�����K��׻�V�]q��{8�Ʉ��(�g�QP.��#-�Gr���OT�ؓ��X�����Q;��د�Xn˺(�f�=շ7�k����Ҕ>��귯�I��ӁJ�Rn>�ݷ�'����R0ّ��x���.w�g)��.�)l���@-�`�d��
��4���fN����������"I�?���     